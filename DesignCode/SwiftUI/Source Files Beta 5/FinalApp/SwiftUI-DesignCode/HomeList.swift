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
    @State var showCourseView = false
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("Courses").font(.largeTitle).fontWeight(.heavy)
                    Text("21 courses").foregroundColor(.gray)
                }
                Spacer()
                }
                .padding(.top, 78)
                .padding(.leading, 60)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(courses) { course in
                        GeometryReader { geometry in
                            Button(action: {self.showCourseView.toggle()}) {
                                CardView(course: course)
                                    .rotation3DEffect(Angle(degrees: Double(
                                        (geometry.frame(in: .global).minX - 30) / -30
                                    )), axis: (x: 0, y: 10, z: 0))
                                    .sheet(isPresented: self.$showCourseView) {
                                        CourseView(title: course.title, image: course.image)
                                    }
                            }
                        }
                        .frame(width: 246, height: 360)
                    }
                }.padding(30)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 480)
            
            CertificateRow()
            
            CourseRow()
            
            Spacer()
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
    Course(title: "Framer Playground",
           image: "Illustration4",
           color: Color("background8"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Flutter for Designers",
           image: "Illustration5",
           color: Color("background9"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]

struct CardView : View {
    var course = Course(title: "", image: "Illustration1", color: Color.white, shadowColor: Color.black)
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(course.title)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
                .lineSpacing(6)
                .lineLimit(4)
                .padding(30)
            Spacer()
            Image(course.image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(course.color)
            .cornerRadius(30)
            .frame(width: 246, height: 360)
            .shadow(color: course.shadowColor, radius: 20, x: 0, y: 20)
    }
}
