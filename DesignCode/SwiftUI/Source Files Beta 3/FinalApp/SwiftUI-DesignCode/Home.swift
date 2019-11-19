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
            
            HomeList(courses: coursesData)
                .blur(radius: show ? 50 : 0)
                .scaleEffect(showCertificates ? 0.95 : 1)
                .animation(.basic())
                .blur(radius: showCertificates ? 20-viewState.height/10 : 0)
            
            ZStack {
                Spacer()
                }
                .background(Color.black)
                .opacity(showCertificates ? Double(35-viewState.height/5)/100 : 0)
                .animation(.basic())
            
            MenuButton(show: $show)
                .blur(radius: showCertificates ? 5-viewState.height/30 : 0)
                .offset(y: -viewState.height/10)
                .animation(.basic())
            
            MenuRight(showCertificates: $showCertificates)
                .blur(radius: showCertificates ? 6-viewState.height/30 : 0)
                .offset(y: -viewState.height/20)
                .animation(.basic())
            
            MenuView(menu: menu)
                .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
                .animation(.basic(duration: 0.3, curve: .easeInOut))
                .offset(x: show ? 0 : -UIScreen.main.bounds.width)
                .tapAction {
                    self.show.toggle()
                }
            
            ContentView()
                .cornerRadius(showCertificates ? viewState.height/5 : 30)
                .shadow(color: Color("buttonShadow"), radius: 30, x: 0, y: 0)
                .offset(y: showCertificates ? 0 : screen.height + 200)
                .offset(y: viewState.height)
                .rotationEffect(Angle(degrees: showCertificates ? 0 : -30))
                .animation(.default)
                .scaleEffect(1-viewState.height/1000)
                .tapAction {
                    self.showCertificates.toggle()
                }
                .gesture(
                    DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                    }
                    .onEnded { value in
                        if self.viewState.height > 100 {
                            self.showCertificates = false
                        }
                        self.viewState = .zero
                    }
                )
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct Home_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            Home(menu: menuData)
//                .environment(\.colorScheme, .dark)
//                .previewDevice("iPhone SE")
//                .environment(\.sizeCategory, .extraExtraExtraLarge)
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
                        Image("Menu")
                            .foregroundColor(.primary)
                        }.padding(17)
                    }
                    .frame(width: 90, height: 56)
                    .background(Color("button"))
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, y: 10)
                    .offset(x: -42, y: 82)
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
                .background(Color("button"))
                .foregroundColor(.primary)
                .cornerRadius(22)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                .tapAction {
                    self.showCertificates.toggle()
                }
                PresentationLink(destination: UpdateList()) {
                    VStack {
                        Image(systemName: "bell")
                    }
                    .foregroundColor(.primary)
                    .frame(width: 44, height: 44)
                    .background(Color("button"))
                    .cornerRadius(22)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            }.padding().offset(y: 70)
            Spacer()
        }
    }
}
