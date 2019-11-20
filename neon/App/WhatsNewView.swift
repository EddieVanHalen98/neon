//
//  WhatsNewView.swift
//  neon
//
//  Created by James Saeed on 02/11/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import SwiftUI

struct WhatsNewView: View {
    
    @Binding var showWhatsNew: Bool
    
    var body: some View {
        VStack {
            WhatsNewHeader(title: "What's new in Hour Blocks 3.0")
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 16) {
                WhatsNewItem(title: "A fresh coat of paint  🎨", content: "Brand new icons, a new font and redesigned interfaces- everything’s just brand new! And it's all synced across iCloud!")
                WhatsNewItem(title: "Look into the future  👀", content: "Take a sneak peak at blocks up to a month into the future")
                WhatsNewItem(title: "Instant suggestions  ⚡️", content: "Get suggested blocks based on what you've previously added- they're lightning fast!")
            }
            
            Spacer()
            ActionButton(title: "Let's go!")
                .onTapGesture {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    self.showWhatsNew = false
                }
        }.padding(40)
    }
}

struct WhatsNewHeader: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 34, weight: .bold, design: .default))
            .multilineTextAlignment(.center)
    }
}

struct WhatsNewItem: View {
    
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            Text(content)
                .font(.system(size: 17, weight: .regular, design: .default))
        }
    }
}
