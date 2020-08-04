//
//  AnalyticsGateway.swift
//  neon
//
//  Created by James Saeed on 15/05/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation
import Firebase

class AnalyticsGateway {
	
	static let shared = AnalyticsGateway()
    
    func log(hourBlock: HourBlock) {
//        Analytics.logEvent("hourBlock5", parameters: ["domain": hourBlock.domain?.rawValue ?? "default"])
    }
    
    func log(suggestion: Suggestion) {
//        Analytics.logEvent("suggestion", parameters: ["domain": suggestion.domain.rawValue,
//                                                      "reason": suggestion.reason])
    }
    
    func logShowAddBlock() {
//        Analytics.logEvent("showAddBlock", parameters: nil)
    }
    
    func logToDo() {
//        Analytics.logEvent("toDo", parameters: nil)
    }
}
