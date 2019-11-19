//
//  CourseView.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-23.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct CourseView : View {
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2")]), startPoint: .top, endPoint: .bottom))
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(title)
                        .color(Color("primary"))
                        .font(.title)
                        .fontWeight(.heavy)
                        .lineLimit(3)
                    Text("10 sections")
                        .color(Color("secondary"))
                        .padding(.top, 0)
                    }
                    .frame(width: 200)
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width-60, height: 200)
                    .padding()
                Spacer()
            }
            .padding(.top, 20)
            
            ZStack(alignment: .topTrailing) {
                HStack {
                    Image(systemName: "play.fill")
                        .font(.largeTitle)
                    }
                    .frame(width: 100, height: 80)
                    .background(Color("accent"))
                    .cornerRadius(30)
                    .shadow(color: Color("accentShadow"), radius: 10, x: 0, y: 10)
                Spacer()
            }.padding(.all, 30)
            
            ScrollView {
                CardBottom()
                    .frame(width: screen.width, height: screen.height)
                    .padding(.top, 400)
                }.frame(width: screen.width)
        }
    }
}

#if DEBUG
struct CourseView_Previews : PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
#endif
