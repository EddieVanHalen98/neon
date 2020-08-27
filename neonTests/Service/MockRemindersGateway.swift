//
//  MockRemindersGateway.swift
//  Hour Blocks
//
//  Created by James Saeed on 12/08/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import Foundation

struct MockRemindersGateway: RemindersGatewayProtocol {
    
    func setReminder(for hourBlock: HourBlock, with title: String) { }
    
    func removeReminder(for hourBlock: HourBlock) { }
    
    func editReminder(for hourBlock: HourBlock, with title: String) { }
}
