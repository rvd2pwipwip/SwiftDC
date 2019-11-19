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
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2")]), startPoint: .top, endPoint: .bottom))
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(self.title)
                            .foregroundColor(Color("primary"))
                            .font(.title)
                            .fontWeight(.heavy)
                            .lineLimit(3)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Text("10 sections")
                            .foregroundColor(Color("secondary"))
                            .padding(.top, 0)
                        Spacer()
                    }
                    .frame(width: 180, height: 150)
                    
                    Image(self.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width-60, height: 200)
                        .padding()
                    Spacer()
                }
                .padding(.top, 40)
                .padding(.leading, 10)
                
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
                }
                .padding(.top, 20)
                .padding(.all, 20)
                
                ScrollView {
                    CardBottom()
                        .background(Color.white)
                        .cornerRadius(30)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .padding(.top, 400)
                }
                .frame(width: geometry.size.width)
            }
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
