//
//  ContactView.swift
//  CareKitUIWorkspace
//
//  Created by John Le on 9/25/20.
//

import CareKitUI
import SwiftUI

struct ContactView: UIViewRepresentable {
    var title: String
    var detail: String?
    
    func makeUIView(context: Context) -> OCKSimpleContactView {
        let contactView = OCKSimpleContactView()
        
        contactView.headerView.titleLabel.text = "Doxylamine"
        contactView.headerView.detailLabel.text = "Family Practice"
        
        return contactView
    }
    
    func updateUIView(_ uiView: OCKSimpleContactView, context: Context) {
        uiView.headerView.titleLabel.text = loc(title)
        
        if let detail = detail {
            uiView.headerView.detailLabel.text = loc(detail)
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContactView(title: "Test")
            ContactView(title: "Test", detail: "Sample Details")
        }
    }
}
