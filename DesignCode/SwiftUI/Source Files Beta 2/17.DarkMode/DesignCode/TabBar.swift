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
            Home().tabItemLabel(
                VStack {
                    Image("IconHome")
                    Text("Home")
                }
            )
            .tag(1)
            ContentView().tabItemLabel(
                VStack {
                    Image("IconCards")
                    Text("Certificates")
                }
            )
            .tag(2)
            UpdateList().tabItemLabel(
                VStack {
                    Image("IconSettings")
                    Text("Updates")
                }
            )
            .tag(3)
        }
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
