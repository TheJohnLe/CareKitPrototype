//
//  ContentView.swift
//  CareKitUIPrototype
//
//  Created by John Le on 9/25/20.
//

import UIKit // Needed for UIImage
import SwiftUI
import CareKit
import CareKitUI
import CareKitStore

struct ContentView: View {
    
    var body: some View {
        //MySynchronizedTaskView()
        MyLinkView()
        MyLabeledValueTaskView()
        MyCompsedSimpleTaskView()
        MySimpleTaskView()
        
        // TODO: Currently showing this, maybe somehow create a whole view ? Not sure
//        VStack {
//            SimpleTaskView(title:Text("Sample SimpleTaskView"), isComplete: false)
//            InstructionsTaskView(title:Text("Sample InstructionsTaskView"), isComplete: false)
//            ChartView(title: "Sample ChartView", selected: .constant(false))
//            ContactView(title: "Sample Contact", detail: "Sample Details Appear Here")
//            LogTaskView(title: "Sample LogTaskView", selected: .constant(false))
            
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
        //}
    }
}

//struct MyFeaturedContentView: OCKFeaturedContentView {
//    let featureView = OCKFeaturedContentView()
//
//    featureView.imageView.image = UIImage(named: "groceries")
//    featureView.label.text = "Easy & Healthy Recipes"
//
//    return featureView
//}

struct MyNumericProgressTaskView: View {
    
    var body: some View {
        NumericProgressTaskView(
            title: Text("Exercise Minutes"),
            detail: Text("Anytime"),
            progress: Text("22"),
            goal: Text("30"),
            instructions: Text("Sample Progress Instructions."),
            isComplete: false)
    }
}

struct MyLabeledValueTaskView: View {
    
    var body: some View {
        LabeledValueTaskView(
            title: Text("HeartRate"),
            detail: Text("Most recent measurement"),
            state: .complete(Text("62"),
                             Text("BPM")
            ))
    }
}

struct MySimpleTaskView: View {
    
    var body: some View {
        SimpleTaskView(isComplete: false) {
            HStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.accentColor)
                    .frame(width: 5)
                HeaderView(title: Text("Stretches"),
                           detail:Text("15 minute"))
            }
            .padding()
        }
    }
}

struct MyCompsedSimpleTaskView: View {
    
    var body: some View {
        CardView {
            VStack(alignment: .leading) {
                ChartView(title: "Testing ChartView", selected: .constant(false))
                Divider()
                Text("This is some sample text to try out showing some details of this chart.")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
