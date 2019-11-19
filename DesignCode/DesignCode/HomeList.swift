//
//  HomeList.swift
//  DesignCode
//
//  Created by Herve Desrosiers on 2019-10-13.
//  Copyright © 2019 Herve Desrosiers. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    var courses = coursesData //coursesData is the local data for the courses
    @State var showModal = false //state value to animate the modal display
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("22 courses")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading, 60)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(courses) { item in
                            //wrap each item in a modal display toggle button
                            Button(action: { self.showModal.toggle() }) {
                                GeometryReader { geometry in
                                    CourseView(
                                        //assign values for each var (prop) in CourseView component
                                        title: item.title,
                                        image: item.image,
                                        color: item.color,
                                        shadowColor: item.shadowColor
                                    )
                                        .rotation3DEffect(Angle(degrees:
                                            Double(geometry.frame(in: .global).minX - 30) / -40 //3d rotation angle will depend on minX (of frame) scroll value in global (full screen) geometry
                                        ), axis: (x: 0, y: 10.0, z: 30))
                                        //MenuRow(image: item.icon, text: item.title)
                                        //sheets are used to present new views modally over existing ones
                                        .sheet(isPresented: self.$showModal) { ContentView() }
                                }
                                .frame(width: 246, height: 360) //the GeometryReader must have a frame
                            }
                        }
                    }
                        .padding(.horizontal, 30) // counter padding to remove 3d effect on start in 3DEffect (...minX - 30)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    Spacer()
                }
                CertificateRow()                
            }
            .padding(.top, 78)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    //declare component dynamic variables (props) with default values
    var title = "Build an app with SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    //use variables in component's body
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title) //assign component variable
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .padding(30) //left padding
                .lineLimit(4)
                .padding(.trailing, 50) //right padding
            Spacer()
            Image(image) //assign component variable
                .resizable() //make images resizable when larger than container
                .renderingMode(.original) //images inside buttons get the tint color unless the original renderingMode is used
                .aspectRatio(contentMode: .fit) //resized images fit the frame
                .frame(width: 246, height: 150) //make sure each image has the same size
                .padding(.bottom, 30)
        }
            .background(color) //assign component variable
            .cornerRadius(30)
            .frame(width: 246, height: 360)
            .shadow(color: shadowColor, radius: 10, x: 0, y: 20) //assign component variable
    }
}

//set data model of course cards
struct Course : Identifiable { //identify each row as unique with an id
    var id = UUID() //Universally Unique IDentifier guaranteed to be unique across all devices in the world
    var title: String //title property is a string
    var image: String //image property is a string
    var color: Color //color property is a color
    var shadowColor: Color //shadowColor property is a color
}

//cards data
let coursesData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("backgroundShadow3")),
    Course(title: "Design and animate your UI",
           image: "Illustration2",
           color: Color("background4"),
           shadowColor: Color("backgroundShadow4")),
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
