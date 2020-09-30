//
//  CareStoreReferenceManager.swift
//  CareKitWorkspace
//
//  Created by John Le on 9/22/20.
//  Copyright © 2020 John Le. All rights reserved.
//

import Foundation
import CareKit
import CareKitStore

// Singleton wrapper to hold a reference to OCKSyncronizedStoreManager and task identifiers
final class CareStoreReferenceManager {
    
    enum TaskIdentifiers: String, CaseIterable {
        case coughingEpisodes
        case stretchingEpisodes
        case walkingEpisodes
    }
    
    static let shared = CareStoreReferenceManager()
    
    // Manage syncronization of a CoreData store
    lazy var syncronizedStoreManager: OCKSynchronizedStoreManager = {
        let store = OCKStore(name: "SFSU Sample Tracker")
        store.populateDailyTasks()
        let manager = OCKSynchronizedStoreManager(wrapping: store)
        return manager
    }()
    
    private init() {}
    
}
