//
//  Tip.swift
//  Hour Blocks
//
//  Created by James Saeed on 14/10/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import Foundation

/// An enum mapping the tips that can be shown as Tip Cards within the app.
enum Tip: CustomStringConvertible {
    
    case blockOptions
    case headerSwipe
    
    case toDoSiri
    
    var description: String {
        switch self {
        #if targetEnvironment(macCatalyst)
        case .blockOptions: return "Right click on a block for more options"
        #else
        case .blockOptions: return "Hold down on a block for more options"
        #endif
        case .headerSwipe: return "Swipe across the header to change days"
            
        case .toDoSiri: return "Ask Siri to add an item in Hour Blocks"
        }
    }
}
