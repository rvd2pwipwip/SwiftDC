//
//  UpdateDetail.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-23.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct UpdateDetail : View {
    var title = "SwiftUI"
    var text = "Take your static design to the next level and build real apps with the simplicity of a prototpying tool. The best way to beginners to learn code, and the most efficient way for developers to learn design."
    var image = "Illustration1"
    var body: some View {
        VStack(spacing: 20) {
            Text(title).font(.largeTitle).fontWeight(.heavy)
            Image(image).resizable().aspectRatio(contentMode: .fit)
            Text(text)
                .lineLimit(100)
            Spacer()
        }
        .padding(30)
    }
}

#if DEBUG
struct UpdateDetail_Previews : PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
#endif
