//
//  CardBottom.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-22.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct CardBottom : View {
    var text = "5 years ago, I couldn’t write a single line of Swift. I learned it and moved to React, Flutter while using increasingly complex design tools. I don’t regret learning them because SwiftUI takes all of their best concepts. It is hands-down the best way for designers to take a first step into code."
    var body: some View {
        ZStack {
            BlurView(style: .extraLight)
            VStack {
                Rectangle()
                    .frame(width: 60, height: 6)
                    .cornerRadius(3.0)
                    .opacity(0.3)
                    .padding(.top, 16)
                VStack {
                    Text(text)
                        .color(Color("background2"))
                        .lineLimit(100)
                        .padding(20)
                    Spacer()
                }
            }
        }
        .background(Color(hue: 1, saturation: 0, brightness: 1, opacity: 0.5))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

#if DEBUG
struct CardBottom_Previews : PreviewProvider {
    static var previews: some View {
        CardBottom()
    }
}
#endif
