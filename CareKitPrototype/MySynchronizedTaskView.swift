import CareKit
import CareKitUI
import CareKitStore
import SwiftUI

struct MySynchronizedTaskView: View {
    
    let storeManager: OCKSynchronizedStoreManager
    
    @State private var isShowingSurvey = false
    
    var body: some View {
        CareKit.SimpleTaskView(taskID: "researchKitSurveyTask",
                               eventQuery: OCKEventQuery(for: Date()),
                               storeManager: storeManager) { controller in
            CareKitUI.SimpleTaskView(
                title: Text(controller.viewModel?.title ?? ""),
                detail: controller.viewModel?.detail.map(Text.init),
                isComplete: controller.viewModel?.isComplete ?? false
            ) {
                isShowingSurvey = true
            }
        }
        .popover(isPresented: $isShowingSurvey) {
            // to be implemented
            //ResearchKitSurvey()
        }
    }
}
