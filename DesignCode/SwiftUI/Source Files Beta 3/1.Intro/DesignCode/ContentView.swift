//
//  ContentView.swift
//  DesignCode
//
//  Created by Meng To on 2019-06-23.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            VStack {
                Text("UI Design")
                    .font(.title)
                    .fontWeight(.bold)
                    .color(Color("accent"))
                    .padding(.top)
                Text("Certificate")
                    .color(.white)
            }
            Image("Background")
            }
            .background(Color.black)
            .cornerRadius(10)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
