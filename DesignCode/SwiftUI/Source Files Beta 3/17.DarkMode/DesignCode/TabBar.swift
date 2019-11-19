//
//  TabBar.swift
//  DesignCode
//
//  Created by Meng To on 2019-07-01.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct TabBar : View {
    var body: some View {
        TabbedView {
            Home().tabItem({
                Image("IconHome")
                Text("Home")
            })
            ContentView().tabItem({
                Image("IconCards")
                Text("Certificates")
            })
            UpdateList().tabItem({
                Image("IconSettings")
                Text("Updates")
            })
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct TabBar_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            TabBar()
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
#endif
