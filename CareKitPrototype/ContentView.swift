//
//  ContentView.swift
//  CareKitUIPrototype
//
//  Created by John Le on 9/25/20.
//

import SwiftUI
import CareKitUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            SimpleTaskView(title:Text("Sample SimpleTaskView"), isComplete: false)
            InstructionsTaskView(title:Text("Sample InstructionsTaskView"), isComplete: false)
            ChartView(title: "Sample ChartView", selected: .constant(false))
            ContactView(title: "Sample Contact", detail: "Sample Details Appear Here")
            LogTaskView(title: "Sample LogTaskView", selected: .constant(false))
            
            /* Possible to add OCKCustomHeaderView to a custom OCKView
            InstructionsTaskView(isComplete: false,
                                 instructions: Text("Instructions"),
                                 action: action,
                                 header: { CustomHeaderView() })    // Inject a custom header here.
            */
            
            // Possible to customize CardView further to handle displaying other OCKViews
            //CardView {
            //    SimpleTaskView(title:"Sample SimpleTaskView", selected: .constant(false))
            //    InstructionsTaskView(title:"Sample InstructionsTaskView", selected: .constant(false))
            //}
            
            // Possible to add OCKStyler to ContentView and apply to custom OCKView
            // InstructionsTaskView(/*...*/)
            //   .careKitStyle(CustomStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
