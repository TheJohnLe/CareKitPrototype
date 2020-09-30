//
//  ChartView.swift
//  CareKitUIWorkspace
//
//  Created by John Le on 9/25/20.
//

import CareKitUI
import SwiftUI

struct ChartView: UIViewRepresentable {
    var title: String
    @Binding var selected: Bool
    var detail: String?
    
    func makeUIView(context: Context) -> OCKCartesianChartView {
        let chartView = OCKCartesianChartView(type: .bar)
        
        chartView.headerView.titleLabel.text = "Doxylamine"
        
        chartView.graphView.dataSeries = [
            OCKDataSeries(values: [0, 1, 1, 2, 3, 3, 2], title: "Doxylamine")
        ]
        
        return chartView
    }
    
    func updateUIView(_ uiView: OCKCartesianChartView, context: Context) {
        uiView.headerView.titleLabel.text = loc(title)
        
        if let detail = detail {
            uiView.headerView.detailLabel.text = loc(detail)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ChartView(title: "Test", selected: .constant(false))
            ChartView(title: "Test", selected: .constant(true))
        }
    }
}
