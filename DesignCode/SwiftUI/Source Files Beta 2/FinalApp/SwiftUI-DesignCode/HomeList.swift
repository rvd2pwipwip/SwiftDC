//
//  MenuModal.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-21.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct HomeList : View {
    var courses = coursesData
    var body: some View {
        ScrollView(alwaysBounceHorizontal: false) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Courses").font(.largeTitle).fontWeight(.heavy)
                    Text("21 courses").color(.gray)
                }
                Spacer()
                }
                .padding(.leading, 78)

            ScrollView(showsHorizontalIndicator: false) {
                HStack(spacing: 30) {
                    ForEach(courses) { course in
                        PresentationButton(destination: CourseView(title: course.title, image: course.image)) {
                            CardView(
                                title: course.title,
                                image: course.image,
                                color: course.color,
                                shadowColor: course.shadowColor
                            )
                        }
                    }
                    }.padding(40)
                }
                .frame(width: UIScreen.main.bounds.width, height: 460)
            
            
            CertificateRow()
            
            CourseRow()
        }
    }
}

#if DEBUG
struct HomeBack_Previews : PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
#endif

struct Course : Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color(hue: 0.677, saturation: 0.701, brightness: 0.788),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Design and animate your UI",
           image: "Illustration2",
           color: Color(red: 0.9254901960784314, green: 0.49411764705882355, blue: 0.4823529411764706),
           shadowColor: Color(red: 0.9254901960784314, green: 0.49411764705882355, blue: 0.4823529411764706, opacity: 0.5)),
    Course(title: "Swift UI Advanced",
           image: "Illustration3",
           color: Color("background7"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]

struct CardView : View {
    var title = ""
    var image = "Illustration1"
    var color = Color.white
    var shadowColor = Color.black
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(title)
                .color(.white)
                .font(.title)
                .fontWeight(.bold)
                .lineSpacing(6)
                .frame(width: 150)
                .lineLimit(4)
                .padding(20)
                .padding(.top, 10)
            Spacer()
            Image(image)
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246)
            }
            .background(color)
            .cornerRadius(30)
            .frame(width: 246, height: 360)
            .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}
