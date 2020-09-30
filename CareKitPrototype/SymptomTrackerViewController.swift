//
//  SymptomTrackerViewController.swift
//  CareKitWorkspace
//
//  Created by John Le on 9/22/20.
//  Copyright © 2020 John Le. All rights reserved.
//

import SwiftUI
import CareKit
import CareKitStore

final class SymptomTrackerViewController: OCKDailyPageViewController {
    override func dailyPageViewController(_ dailyPageViewController: OCKDailyPageViewController, prepare listViewController: OCKListViewController, for date: Date) {
        let identifiers = CareStoreReferenceManager.TaskIdentifiers.allCases.map { $0.rawValue }
        var query = OCKTaskQuery(for: date)
        query.ids = identifiers
        query.excludesTasksWithNoEvents = true
        
        storeManager.store.fetchAnyTasks(query: query, callbackQueue: .main) { result in
            guard let tasks = try? result.get() else { return }
            
            tasks.forEach { task in
                switch task.id {
                case CareStoreReferenceManager.TaskIdentifiers.coughingEpisodes.rawValue:
                    let coughingCard = OCKButtonLogTaskViewController(task: task,
                                                                      eventQuery: .init(for: date),
                                                                      storeManager: self.storeManager)
                    listViewController.appendViewController(coughingCard, animated: false)
                case CareStoreReferenceManager.TaskIdentifiers.stretchingEpisodes.rawValue:
                    let stretchingCard = OCKSimpleTaskViewController(task: task, eventQuery: .init(for: date), storeManager: self.storeManager);
                    listViewController.appendViewController(stretchingCard, animated: false)
                case CareStoreReferenceManager.TaskIdentifiers.walkingEpisodes.rawValue:
                    let walkingCard = OCKInstructionsTaskViewController(task: task, eventQuery: .init(for: date),
                                                                        storeManager: self.storeManager);
                    listViewController.appendViewController(walkingCard, animated: false)
                default: return
                }
            }
        }
    }
}
