//
//  MenuView.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-22.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct MenuView : View {
    var menuItems = ["My Account", "Billing", "Team", "Sign out"]
    var menu: [Menu] = menuData
    var showModal = false
    
    var body: some View {
        ZStack {
            BlurView(style: .extraLight)
            
            VStack {
                ForEach(menu) { item in
                    PresentationButton(destination: Settings()) {
                        MenuItem(title: item.title, icon: item.icon)
                    }
                }
                
                Spacer()
                
                HStack {
                    Text("Version 0.9").color(.gray)
                    Spacer()
                }
                
            }
            .padding(30).padding(.top, 30)
        }
        .background(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
        .cornerRadius(30)
        .padding(.top, 44)
        .padding(.trailing, 50)
        .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.5), radius: 30, x: 0, y: 20)
        .shadow(color: Color(hue: 0.68, saturation: 0.0, brightness: 0.0, opacity: 0.15), radius: 50, x: 0, y: 0)
    }
}

struct MenuItem : View {
    var title = ""
    var icon = "creditcard"
    var body: some View {
        return HStack {
            Image(systemName: icon)
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(red: 0.6627450980392157, green: 0.7333333333333333, blue: 0.8313725490196079))
            Text(title)
                .font(.headline)
                .color(.black)
                .padding(.leading, 10)
            Spacer()
            }
            .padding(10)
    }
}

struct Menu : Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down"),
    Menu(title: "Settings", icon: "gear")
]

#if DEBUG
struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
#endif
