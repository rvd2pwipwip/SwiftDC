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
                .tag(1)
            ContentView().tabItem({
                Image("IconCards")
                Text("Certificates")
            })
                .tag(2)
            UpdateList().tabItem({
                Image("IconSettings")
                Text("Updates")
            })
                .tag(3)
        }
    }
}

#if DEBUG
struct TabBar_Previews : PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
#endif
