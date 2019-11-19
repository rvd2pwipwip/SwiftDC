//
//  TabBar.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-22.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct TabBar : View {
    var body: some View {
        TabbedView {
            Home()
                .tabItem({
                    Image("IconHome")
                    Text("Home")
                })
            ContentView()
                .tabItem({
                    Image("IconCards")
                    Text("Certificates")
                })
            Settings()
                .tabItem({
                    Image("IconSettings")
                    Text("Settings")
                })
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct TabBar_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().environment(\.colorScheme, .dark)
            TabBar()
                .previewDevice("iPhone 8")
                .environment(\.sizeCategory, .extraSmall)
        }
    }
}
#endif
