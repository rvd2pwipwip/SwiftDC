//
//  Home.swift
//  DesignCode
//
//  Created by Herve Desrosiers on 2019-10-11.
//  Copyright © 2019 Herve Desrosiers. All rights reserved.
//

import SwiftUI

//let statusBarHeight = UIApplication.shared.statusBarFrame.height //deprecated
let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
let screen = UIScreen.main.bounds

struct Home: View {
    @State var show = false //state value to animate the display of the MenuView
    @State var showProfile = false //state value to animate the display of the ContentView
    @State var showUpdate = false
    
    var body: some View {
        ZStack { //z stack to put side menu on top of other components
            
            HomeList()
                .blur(radius: show ? 20 : 0) //blur screen content when menu is displayed
                .scaleEffect(showProfile ? 0.95 : 1)            
                .animation(.default) //animate blur and scale
            
            ContentView() //import and display ContentView component
                //a background would cancel the blur effect (when menu is called)
//                .background(Color.white)
                .frame(minWidth: 0, maxWidth: 712)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring(response: 0.5, dampingFraction: 0.75, blendDuration: 0.5))
                .offset(y: showProfile ? statusBarHeight + 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show) //pass show state and listen to its changes ($)
                .offset(x: -40, y: showProfile ? statusBarHeight : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile, showUpdate: $showUpdate) //pass showProfile and show state and listen to changes ($)
                .offset(x: -16, y: showProfile ? statusBarHeight : 88)
                .animation(.spring())
            
            MenuView(show: $show) //pass show state and listen to its changes ($)
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all) //so background color is applied to status bar
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home().previewDevice("iPhone SE")
            Home().previewDevice("iPhone Xr")
            Home().previewDevice("iPad Pro (9.7-inch)")
        }
    }
}

struct MenuRow: View { //defines a menu row to have an image and a text stacked horizontally
    var image = "creditcard" //default image value
    var text = "My Account" //default text value
    var body: some View {
        HStack {
            Image(systemName: image) //format icon with font parameters because using SF Symbols
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            HStack {
                Text(text)
                    .foregroundColor(.primary)
                    .font(.headline)
                Spacer()
            }
        }
    }
}

//set data model of menu items
struct Menu : Identifiable { //identify each row as unique with an id
    var id = UUID() //Universally Unique IDentifier guaranteed to be unique across all devices in the world
    var title : String //title property is a string
    var icon : String //icon property is a string
}

let menuData = [ //uses Menu data model for each item
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Settings", icon: "gear"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign out", icon: "arrow.uturn.left"),
]

struct MenuView: View {
    var menuItems = ["My Account", "Billing", "Team", "Sign out"]
    var menu = menuData //menuData is the local data for the menu
    @Binding var show : Bool //value comes from elsewhere and is shared in both places
    @State var showSettings = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) { //v stack used to store menu items
                ForEach(menu) { item in //each item in menu data creates a menu row with an image and a text
                    if item.title == "Settings" {
                        MenuRow(image: item.icon, text: item.title)
                            .sheet(isPresented: self.$showSettings) { Settings() }
                            .onTapGesture {
                                self.showSettings.toggle()
                        }
                    } else {
                        MenuRow(image: item.icon, text: item.title)
                    }
                    
                    
                }
                Spacer() //pushes menu items towards top of container
            }
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
            .animation(.easeOut(duration: 0.4))
            .offset(x: show ? 0 : -UIScreen.main.bounds.width) //get device screen width to offset component off the screen
            .onTapGesture {
                self.show.toggle()
            }
            Spacer() //push side menu stack to the left of the screen
        }
        .padding(.top, statusBarHeight)
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primary)
        }
        .frame(width: 44, height: 44)
        .background(Color("button"))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show : Bool //value comes from elsewhere and is shared in both places
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {self.show.toggle()}) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary) //replaced black with primary to support dark mode
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color("button"))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            Spacer()
        }
    }
}

struct MenuRight: View {
    @Binding var show : Bool //value comes from elsewhere and is shared in both places
    @Binding var showUpdate : Bool
    var body: some View {
        ZStack(alignment: .topTrailing) { //z stack used to put side menu on top of other components
            HStack {
                Button(action: {self.show.toggle()}) {
                    CircleButton(icon: "person.crop.circle")
                }
//                Button(action: { self.showUpdate.toggle() }) {
                    CircleButton(icon: "bell")
                        .sheet(isPresented: self.$showUpdate) { UpdateList() }
                        .onTapGesture {
                            self.showUpdate.toggle()
                }
//                }
            }
            Spacer()
        }
    }
}

