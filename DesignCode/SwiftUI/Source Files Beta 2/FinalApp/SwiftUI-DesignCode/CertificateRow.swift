//
//  CertificateRow.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-22.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct CertificateRow : View {
    var certificates = certificateData
    var body: some View {
        VStack(alignment: .leading) {
            Text("Certificates")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 40)
            ScrollView(showsHorizontalIndicator: false) {
                HStack(spacing: 20) {
                    ForEach(certificates) { item in
                        
                        PresentationButton(destination: ContentView()) {
                            CertificateItem(title: item.title, image: item.image)
                                .frame(width: 230.0, height: 150)
                                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                        }
                    }
                    }.padding(.leading, 40).padding(.top, 10)
                
            }.frame(height: 200)
        }
    }
}

struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

let certificateData = [
    Certificate(title: "UI Design", image: "Certificate1"),
    Certificate(title: "SwiftUI", image: "Certificate2"),
    Certificate(title: "Sketch", image: "Certificate3"),
    Certificate(title: "Framer", image: "Certificate4")
]

#if DEBUG
struct CertificateRow_Previews : PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}
#endif
