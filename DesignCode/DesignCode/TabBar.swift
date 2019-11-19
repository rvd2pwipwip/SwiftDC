//
//  TabBar.swift
//  DesignCode
//
//  Created by Herve Desrosiers on 2019-10-16.
//  Copyright © 2019 Herve Desrosiers. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        //TabView(selection: .constant(2)) { //default tab selection not working
        TabView { //default tab selection not working
            Home().tabItem({
                Image("IconHome")
                Text("Home")
            })
                .tag(1) //was used select default tab but buggy...
            ContentView().tabItem({
                Image("IconCards")
                Text("Certificates")
            })
                .tag(2)
            Settings().tabItem({
                Image("IconSettings")
                Text("Settings")
            })
                .tag(3)
        }
        .edgesIgnoringSafeArea(.top) //hide status bar
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            TabBar()
                .environment(\.colorScheme, .dark)
        }
//            .environment(\.sizeCategory, .extraExtraLarge)
    }
}
