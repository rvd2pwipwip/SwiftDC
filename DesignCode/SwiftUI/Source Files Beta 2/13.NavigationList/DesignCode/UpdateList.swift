//
//  UpdateList.swift
//  DesignCode
//
//  Created by Meng To on 7/3/19.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct UpdateList : View {
    var updates = updateData
    
    var body: some View {
        NavigationView {
            List(updates) { item in
                NavigationButton(destination: Text("1")) {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        
                        Text(item.text)
                            .lineLimit(3)
                            .font(.system(size: 15))
                            .lineSpacing(4)
                            .frame(height: 50)
                        
                        Text(item.date)
                            .font(.caption)
                            .fontWeight(.bold)
                            .color(.gray)
                    }
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(trailing:
                PresentationButton(destination: Text("Settings")) {
                    Image(systemName: "gear")
                }
            )
        }
    }
}

#if DEBUG
struct UpdateList_Previews : PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
#endif

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Illustration1", title: "SwiftUI", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 26"),
    Update(image: "Illustration2", title: "Framer X", text: "Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.", date: "JUN 11"),
    Update(image: "Illustration3", title: "CSS Layout", text: "Learn how to combine CSS Grid, Flexbox, animations and responsive design to create a beautiful prototype in CodePen.", date: "MAY 26"),
    Update(image: "Illustration4", title: "React Native Part 2", text: "Learn how to implement gestures, Lottie animations and Firebase login.", date: "MAY 15"),
    Update(image: "Certificate1", title: "Unity", text: "Unity course teaching basics, C#, assets, level design and gameplay", date: "MAR 19"),
    Update(image: "Certificate2", title: "React Native for Designers", text: "Build your own iOS and Android app with custom animations, Redux and API data.", date: "FEB 14"),
    Update(image: "Certificate3", title: "Vue.js", text: "Make a dashboard web-app with a complete login system, dark mode, and animated charts for your data.", date: "JAN 23")
]