//
//  OCKStore.swift
//  CareKitWorkspace
//
//  Created by John Le on 9/22/20.
//  Copyright © 2020 John Le. All rights reserved.
//

import Foundation
import CareKitStore

extension OCKStore {
    
    // Adds tasks and contacts to the store
    func populateDailyTasks() {
        // Setup the task date
        let thisMorning = Calendar.current.startOfDay(for: Date())
        guard let beforeBreakfast = Calendar.current.date(byAdding: .hour, value: 8, to: thisMorning) else {
            return assertionFailure("Could not create time 8AM this morning")
        }
        
        
        guard let afterLunch = Calendar.current.date(byAdding: .hour, value: 12, to: thisMorning) else {
            return assertionFailure("Could not create time 12PM noon")
        }
        
        // Create Coughing Schedule
        let coughingSchedule = OCKSchedule(composing: [
            OCKScheduleElement(start: beforeBreakfast,
                               end: nil,
                               interval: DateComponents(day: 1),
                               text: "Anytime throughout the day",
                               targetValues: [],
                               duration: .allDay)
        ])
        
        // Create walking schedule
        let walkingSchedule = OCKSchedule(composing: [
            OCKScheduleElement(start: afterLunch,
                               end: nil,
                               interval: DateComponents(day: 1),
                               text: "Anytime throughout the day",
                               targetValues: [],
                               duration: .allDay)
        ])
        
        // Create coughing task
        var coughingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.coughingEpisodes.rawValue,
                                   title: "Track coughing",
                                   carePlanUUID: nil, schedule: coughingSchedule)
        coughingTask.instructions = "If you have coughed for a duration of 1 minute or more, please log it here."
        coughingTask.impactsAdherence = false
        
        // TODO: Maybe converting View to OCKTask?
        // var testTask = ChartView(title: "Test Custom testTask", selected: .constant(.false), detail: "Custom Test Task Details")
        
        // Create stretching task
        var stretchingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.stretchingEpisodes.rawValue,
                                     title:"Track stretching",
                                     carePlanUUID: nil, schedule: coughingSchedule)
        stretchingTask.instructions = "From a standing position, reach down as far as you can to try to touch the floor without bending your legs."
        stretchingTask.impactsAdherence = false
        
        // Create walking task
        var walkingTask = OCKTask(id: CareStoreReferenceManager.TaskIdentifiers.walkingEpisodes.rawValue, title: "Walk for 6 minutes", carePlanUUID: nil, schedule: walkingSchedule)
        walkingTask.instructions = "Walk for at least 6 minutes."
        walkingTask.impactsAdherence = false
        
        // Add the tasks here
        addTask(coughingTask)
        addTask(stretchingTask)
        addTask(walkingTask)
        
    }
}

