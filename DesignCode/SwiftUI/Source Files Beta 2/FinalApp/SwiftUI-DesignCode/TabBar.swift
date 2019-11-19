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
                .tabItemLabel(VStack {
                    Image("IconHome")
                    Text("Home")
                })
                .tag(1)
            ContentView()
                .tabItemLabel(VStack {
                    Image("IconCards")
                    Text("Certificates")
                })
                .tag(2)
            Settings()
                .tabItemLabel(VStack {
                    Image("IconSettings")
                    Text("Settings")
                    })
                .tag(3)
        }
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
