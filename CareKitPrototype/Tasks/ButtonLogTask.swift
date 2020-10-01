import SwiftUI
import CareKit
import CareKitStore

struct ButtonLogTask<Content: View>: View {
    let taskID: String
    let tasks: [OCKAnyTask]
    let eventQuery: OCKEventQuery
    let content: ButtonLogTaskWrapper<Content>.ContentFunc
    
    init(taskID: String, tasks: [OCKAnyTask],
         eventQuery: OCKEventQuery = OCKEventQuery(for: Date()),
         @ViewBuilder content: @escaping ButtonLogTaskWrapper<Content>.ContentFunc) {
        self.taskID = taskID
        self.tasks = tasks
        self.eventQuery = eventQuery
        self.content = content
    }
    
    var body: some View {
        ManagerWrapper {
            ButtonLogTaskWrapper(taskID: self.taskID,
                                 tasks: self.tasks,
                                 eventQuery: self.eventQuery,
                                 manager: $0,
                                 content: self.content)
        }
    }
}

struct ButtonLogTaskWrapper<Content: View>: View {
    typealias ContentFunc = (OCKAnyEvent?, [OCKOutcomeValue]?, @escaping (OCKOutcomeValueUnderlyingType?) -> Void) -> Content
    let content: ContentFunc
    @ObservedObject var controller: OCKButtonLogTaskController
    
    var event: OCKAnyEvent? {
        controller.objectWillChange.value?.firstEvent
    }
    
    var values: [OCKOutcomeValue]? {
        controller.objectWillChange.value?.firstEvent?.sortedOutcomeValuesByRecency().outcome?.values
    }
    
    init(taskID: String,
         tasks: [OCKAnyTask],
         eventQuery: OCKEventQuery = OCKEventQuery(for: Date()),
         manager: OCKSynchronizedStoreManager,
         content: @escaping ContentFunc) {
        self.content = content
        self.controller = OCKButtonLogTaskController(storeManager: manager)
        controller.fetchAndObserveEvents(forTasks: tasks, eventQuery: eventQuery)
    }
    
    var log: (OCKOutcomeValueUnderlyingType?) -> Void {
        { type in
            let indexPath = IndexPath(row: 0, section: 0)
            self.controller.appendOutcomeValue(value: type ?? true, at: indexPath, completion: nil)
        }
    }
    
    var body: some View {
        content(event, values, log)
    }
}
