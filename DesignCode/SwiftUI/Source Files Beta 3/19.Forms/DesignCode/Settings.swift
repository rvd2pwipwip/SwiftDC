//
//  Settings.swift
//  DesignCode
//
//  Created by Meng To on 7/10/19.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct Settings : View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $receive) {
                    Text("Receive notifications")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                Picker(selection: $selection, label: Text("Favorite course")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                DatePicker($date) {
                    Text("Date")
                }
                Section(header: Text("Email")) {
                    TextField("Your email", text: $email)
                        .textFieldStyle(.roundedBorder)
                }
                Button(action: { self.submit.toggle() }) {
                    Text("Submit")
                }
                .presentation($submit, alert: {
                    Alert(title: Text("Thanks!"), message: Text("Email: \(email)"))
                })
            }
            .navigationBarTitle("Settings")
        }
    }
}

#if DEBUG
struct Settings_Previews : PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
#endif
