//
//  Home.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-21.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct Home : View {
    @State var show = false
    @State var showCertificates = false
    @State var viewState = CGSize.zero
    var menu: [Menu] = menuData
    
    var body: some View {
        ZStack {
            
            HomeList(courses: coursesData).padding(.top, 78)
                .blur(radius: show ? 50 : 0)
                .scaleEffect(showCertificates ? 0.95 : 1)
                .animation(.default)
            
            MenuButton(show: $show)
            
            MenuRight(showCertificates: $showCertificates)
            
            MenuView(menu: menu)
                .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
                .animation(.basic(duration: 0.3, curve: .easeInOut))
                .offset(x: show ? 0 : -UIScreen.main.bounds.width)
                .tapAction {
                    self.show.toggle()
                }
            
            ContentView()
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 50, x: 0, y: 0)
                .offset(y: showCertificates ? 0 : screen.height + 100)
                .rotationEffect(Angle(degrees: showCertificates ? 0 : -20))
                .animation(.basic(duration: 0.3, curve: .easeInOut))
                .tapAction {
                    self.showCertificates.toggle()
                }
            }
            .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct Home_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            Home(menu: menuData)
//                .environment(\.colorScheme, .dark)
//                .previewDevice("iPhone XS")
//            .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}
#endif


struct MenuButton : View {
    @Binding var show: Bool
    var body: some View {
        return VStack {
            HStack {
                Button(action: { self.show.toggle() }) {
                    HStack {
                        Spacer()
                        Image("Menu").foregroundColor(.black)
                        }.padding(20)
                    }
                    .frame(width: 90, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, y: 10)
                    .offset(x: -30, y: 80)
                    Spacer()
                }
                Spacer()
            }
        }
    }

struct MenuRight : View {
    @Binding var showCertificates: Bool
    
    var body: some View {
        return VStack {
            HStack(spacing: 12) {
                Spacer()
                VStack {
                    Image(systemName: "person.crop.circle")
                }
                .frame(width: 44, height: 44)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(22)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                .tapAction {
                    self.showCertificates.toggle()
                }
                PresentationButton(destination: UpdateList()) {
                    VStack {
                        Image(systemName: "bell")
                    }
                    .foregroundColor(.black)
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .cornerRadius(22)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            }.padding().offset(y: 64)
            Spacer()
        }
    }
}
