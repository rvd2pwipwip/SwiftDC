//
//  ContentView.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-20.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var show = false
    @State var viewState = CGSize.zero
    var body: some View {
        
        ZStack {
            BlurView(style: .light)
            
            Hero()
                .blur(radius: show ? 20 : 0)
                .animation(.basic())
            
            CardBottom(text: "This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .blur(radius: show ? 50 : 0)
                .animation(.basic(duration: 0.3, curve: .easeInOut))
                .offset(y: 640)
            
            CertificateItem(title: "Sketch", image: "Certificate3", background: Color("background9"))
                .frame(width: 340.0, height: 220)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .blendMode(.hardLight)
                .offset( x: viewState.width, y: viewState.height )
                .animation(.basic(duration: 0.6, curve: .easeInOut))
            
            CertificateItem(title: "SwiftUI", image: "Certificate2", background: Color("background8"))
                .frame(width: 340.0, height: 220)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.90)
                .blendMode(.hardLight)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .offset( x: viewState.width, y: viewState.height )
                .animation(.basic(duration: 0.4, curve: .easeInOut))
            
            CertificateItem(title: "UI Design", image: "Certificate1")
                .frame(width: 340.0, height: 220)
                .shadow(radius: 20)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .offset( x: viewState.width, y: viewState.height )
                .animation(.spring())
                .tapAction {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                            self.show = true
                        }
                        .onEnded { value in
                            self.viewState = .zero
                            self.show = false
                        }
                )
            
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct CardBack : View {
    var body: some View {
        return HStack {
            VStack {
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 20)
        .frame(width: 340, height: 220)
    }
}

struct Hero : View {
    var body: some View {
        return VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.all)
                    .padding(.top, 40)
                    Spacer()
                }
                Image("Illustration5")
                Spacer()
            }
        }
    }


