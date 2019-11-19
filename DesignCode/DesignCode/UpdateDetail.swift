//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Herve Desrosiers on 2019-10-15.
//  Copyright © 2019 Herve Desrosiers. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    //set received data
    var title = "SwiftUI"
    var text = "Loading..."
    var image = "Illustration1"
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image(image)
                .resizable() //make image full width of container
                .aspectRatio(contentMode: .fit) //keep image aspect ratio
                .frame(height: 200) //control image height so title is always displayed at same y
            Text(text)
                .lineLimit(nil) //unknown line count for each detail screen
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading) //text will always be full width and adaptive, make sure to set alignment for text
            Spacer() //push VStack content to the top
        }
    .padding(30)
        
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
