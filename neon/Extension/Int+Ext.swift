//
//  Date+Ext.swift
//  neon
//
//  Created by James Saeed on 06/02/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation

extension Int {
    
    func getFormattedHour() -> String {
        if self == 0 {
            return "12AM"
        } else if self < 12 {
            return "\(self)AM"
        } else if self == 12 {
            return "\(self)PM"
        } else {
            return "\(self - 12)PM"
        }
    }
}
