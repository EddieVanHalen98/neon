//
//  CompactHourBlockView.swift
//  Hour Blocks
//
//  Created by James Saeed on 27/07/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

/// A Card based view for displaying an Hour Block without its corresponding Sub Blocks or interactions
struct CompactHourBlockView: View {
    
    @ObservedObject var viewModel: HourBlockViewModel
    
    var body: some View {
        Card {
            VStack(spacing: 20) {
                HStack {
                    CardLabels(title: viewModel.getTitle(),
                               subtitle: viewModel.getFormattedTime())
                    Spacer()
                    HourBlockIcon(viewModel.icon.imageName)
                }
            }
        }.padding(.horizontal, 24)
    }
}
