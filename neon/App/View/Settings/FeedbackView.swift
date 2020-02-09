//
//  FeedbackView.swift
//  neon
//
//  Created by James Saeed on 04/02/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct FeedbackView: View {
    
    @Binding var isPresented: Bool
    
    @ObservedObject var viewModel = FeedbackViewModel()
    
    @State var isLoading = false
    
    @State var displayError = false
    @State var errorMessage = ""
    
    @State var displayConfirmation = false
    
    var body: some View {
        NavigationView {
            // e4 - 0.18
            // e3 - 0.82
            VStack(spacing: 16) {
                if isLoading {
                    ActivityIndicator(isAnimating: $isLoading)
                } else {
                    Text(viewModel.hasVoted ? "You've already voted for a feature- check back after the next Hour Blocks update!" : "Vote for what you’d like to see most in Hour Blocks with 1 vote per update")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .padding(.horizontal, 32)
                        .padding(.top, 16)
                    if viewModel.hasVoted { Spacer() }
                    if !viewModel.hasVoted {
                        List(viewModel.features) { feature in
                            FeatureCard(feature: feature)
                            .onTapGesture {
                                HapticsGateway.shared.triggerLightImpact()
                                self.displayConfirmation = true
                            }
                            .alert(isPresented: self.$displayConfirmation) {
                                Alert(title: Text("Confirm Vote"),
                                      message: Text("Are you sure you'd like to vote for \(feature.description.lowercased())?"),
                                      primaryButton: .default(Text("Yes"), action: { self.vote(for: feature) }),
                                      secondaryButton: .cancel())
                            }
                        }
                    }
                }
            }
            .alert(isPresented: $displayError) {
                Alert(title: Text("Error"),
                      message: Text(errorMessage),
                      dismissButton: .default(Text("OK")))
            }
            .navigationBarTitle("Feedback")
            .navigationBarItems(leading: Button(action: email, label: {
                Text("Email Me")
            }), trailing: Button(action: dismiss, label: {
                Text("Done")
            }))
        }.accentColor(Color("primary"))
        .onAppear(perform: getFeatures)
    }
    
    func email() {
        let email = "support@jtsaeed.com"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    func dismiss() {
        isPresented = false
    }
    
    func getFeatures() {
        isLoading = true
        
        viewModel.checkVote()
        
        viewModel.getFeatures { response in
            self.isLoading = false
            
            guard response == .success else {
                self.displayError = true
                self.errorMessage = response.rawValue
                HapticsGateway.shared.triggerErrorHaptic()
                return
            }
        }
    }
    
    func vote(for feature: Feature) {
        self.isLoading = true
        
        viewModel.vote(for: feature) { response in
            self.isLoading = false
            
            guard response == .success else {
                self.displayError = true
                // 1 -
                // 2 -
                self.errorMessage = response.rawValue
                HapticsGateway.shared.triggerErrorHaptic()
                return
            }
            
            self.viewModel.hasVoted = true
            HapticsGateway.shared.triggerCompletionHaptic()
        }
    }
}

struct FeatureCard: View {
    
    let feature: Feature
    
    var body: some View {
        Card {
            HStack {
                Text(self.feature.description)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                Spacer()
                Image("vote_button").padding(.leading, 24)
            }
        }
    }
}