//
//  Settings.swift
//  DesignCode
//
//  Created by Herve Desrosiers on 2019-10-17.
//  Copyright © 2019 Herve Desrosiers. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive : Bool = false
    @State var number : Int = 1
    @State var selection : Int = 1
    @State var date: Date = Date()
    @State var email : String = ""
    @State var submit : Bool = false
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Toggle(isOn: $receive) { //$ = watch and communicate value back and forth
                        Text("Receive notifications")
                    }
                    Stepper(value: $number, in: 1...10) {
                        Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                    }
                    Picker(selection: $selection, label: Text("Favorite course")) {
                        Text("SwiftUI").tag(1)
                        Text("React").tag(2)
                    }
                    DatePicker(selection: $date, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    
                    Section(header: Text("Email")) {
                        TextField("Your email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Button(action: {self.submit.toggle()}) {
                        Text("Submit")
                    }
                    .alert(isPresented: $submit, content: {
                        Alert(title: Text("Thanks!"), message: Text("Email: \(email)"))
                    })
                }
                .navigationBarTitle("Settings")
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
