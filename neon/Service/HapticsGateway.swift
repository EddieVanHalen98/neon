//
//  AudioGateway.swift
//  neon
//
//  Created by James Saeed on 22/10/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation
import AVFoundation
import SwiftUI

class HapticsGateway {
    
    static let shared = HapticsGateway()
    
    func triggerAddBlockHaptic() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred(intensity: 0.75)
    }
    
    func triggerClearBlockHaptic() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred(intensity: 0.9)
    }
    
    func triggerSwipeHaptic() {
        UIImpactFeedbackGenerator(style: .rigid).impactOccurred(intensity: 0.6)
    }
    
    func triggerFailedSwipeHaptic() {
        UIImpactFeedbackGenerator(style: .rigid).impactOccurred(intensity: 0.4)
    }
    
    func triggerSuccessfulSwipeHaptic() {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred(intensity: 0.5)
    }
    
    func triggerCompletionHaptic() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    func triggerLightImpact() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
    func triggerErrorHaptic() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
}
