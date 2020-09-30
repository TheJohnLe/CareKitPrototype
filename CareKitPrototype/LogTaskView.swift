//
//  LogTaskView.swift
//  CareKitUIWorkspace
//
//  Created by John Le on 9/25/20.
//

import CareKitUI
import SwiftUI

struct LogTaskView: UIViewRepresentable {
    var title: String
    @Binding var selected: Bool
    var detail: String?
    
    // makeUIView is a required protocol function
    func makeUIView(context: Context) -> OCKLogTaskView {
        let taskView = OCKLogTaskView()
        taskView.headerView.titleLabel.text = "Doxylamine"
        taskView.headerView.detailLabel.text = "7:30AM to 8:30AM"
        
        return taskView
    }
    
    // updateUIView is a required protocol function
    func updateUIView(_ uiView: OCKLogTaskView, context: Context) {
        uiView.headerView.titleLabel.text = loc(title)
        
        if let detail = detail {
            uiView.headerView.detailLabel.text = loc(detail)
        }
    }
}

struct LogTaskView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            // Configure parameters here
            LogTaskView(title: "Test", selected: .constant(false))
            LogTaskView(title: "Test", selected: .constant(true))
        }
    }
}
