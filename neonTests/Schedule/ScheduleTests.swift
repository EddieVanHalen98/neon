//
//  ScheduleViewModelTests.swift
//  neonTests
//
//  Created by James Saeed on 19/02/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import XCTest
import CoreData
@testable import Hour_Blocks

class ScheduleTests: XCTestCase {
    
    let date = Date(year: 2020, month: 08, day: 02, hour: 13, minute: 0)
    
    var dataGateway: DataGateway!
    var viewModel: ScheduleViewModel!
    
    override func setUpWithError() throws {
        dataGateway = DataGateway(for: mockPersistantContainer.viewContext)
        viewModel = ScheduleViewModel(dataGateway: dataGateway,
                                      calendarGateway: MockCalendarGateway(),
                                      analyticsGateway: MockAnalyticsGateway(),
                                      remindersGateway: MockRemindersGateway())
    }
    
    override func tearDownWithError() throws { }
    
    func testLoadHourBlocks() {
        dataGateway.save(hourBlock: HourBlock(day: date, hour: 13, title: "Lunch"))
        dataGateway.save(hourBlock: HourBlock(day: date, hour: 15, title: "Gym"))
        dataGateway.save(hourBlock: HourBlock(day: date, hour: 16, title: "Work"))
        
        viewModel.currentDate = date
        viewModel.loadHourBlocks()
        
        XCTAssertEqual(self.viewModel.todaysHourBlocks[15].getTitle(), "Gym")
    }
    
    func testAddHourBlock() {
        viewModel.addBlock(HourBlock(day: Date(), hour: 14, title: "Walk"))
        
        XCTAssertEqual(self.viewModel.todaysHourBlocks[14].getTitle(), "Walk")
    }
    
    func testClearHourBlock() {
        let block = HourBlock(day: Date(), hour: 13, title: "Lunch")
        dataGateway.save(hourBlock: block)
        
        viewModel.clearBlock(block)
        
        XCTAssertEqual(self.viewModel.todaysHourBlocks[14].getTitle(), "Empty")
    }
    
    lazy var mockPersistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "neon")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false // Make it simpler in test env
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )
            
            // Check if creating container wrong
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()
}
