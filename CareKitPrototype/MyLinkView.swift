import CareKitUI
import SwiftUI

struct MyLinkView: View {
    
    var body: some View {
        LinkView(title: Text("Physical Therapist Appointment"),
                 instructions: Text("Some Instructions for Appointment"),
                 links:[
                 // ...
                    .website("https://www.apple.com",
                             title: "Website")
                 // ...
                 ])
    }
}
