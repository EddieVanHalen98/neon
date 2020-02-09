//
//  CardLabels.swift
//  neon
//
//  Created by James Saeed on 12/01/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct CardLabels: View {
    
    let title: String
    let subtitle: String
    
    var titleColor = Color("title")
    var subtitleColor = Color("subtitle")
    var alignment: HorizontalAlignment = .leading
    var lineLimit = 1
    
    var textAlignment: TextAlignment {
        if alignment == .trailing {
            return .trailing
        } else if alignment == .center {
            return .center
        }
        
        return .leading
    }
    
    var body: some View {
        VStack(alignment: alignment, spacing: 4) {
            Text(subtitle.uppercased())
                .modifier(CardSubtitleLabel())
                .foregroundColor(subtitleColor)
            Text(title.smartCapitalization())
                .modifier(CardTitleLabelNoLineLimit())
                .lineLimit(lineLimit)
                .foregroundColor(titleColor)
                .multilineTextAlignment(textAlignment)
        }
    }
}

struct CardSubtitleLabel: ViewModifier {
    
    func body(content: Content) -> some View {
        content.font(.system(size: 14, weight: .semibold, design: .default))
    }
}

struct CardTitleLabelNoLineLimit: ViewModifier {
    
    func body(content: Content) -> some View {
        content.font(.system(size: 22, weight: .bold, design: .rounded))
    }
}

struct CardTitleLabel: ViewModifier {
    
    func body(content: Content) -> some View {
        content.modifier(CardTitleLabelNoLineLimit()).lineLimit(1)
    }
}


