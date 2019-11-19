//
//  Settings.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-22.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct Settings : View {
    @State var receive = true
    @State var emailNumber: Int = 1
    @State var selection: Int = 1
    @State var date: Date = Date()
    @State var email: String = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $receive) {
                    Text("Receive notifications")
                }
                Stepper(value: $emailNumber, in: 1...10) {
                    Text("\(emailNumber) email\(emailNumber > 1 ? "s": "") per month")
                }
                Picker(selection: $selection, label: Text("Favorite course")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                DatePicker($date) {
                    Text("Date")
                }
                Section(header: Text("Email")) {
                    TextField($email, placeholder: Text("Your email"))
                        .textFieldStyle(.roundedBorder)
                        .textContentType(.emailAddress)
                }
                Button(action: { self.submit.toggle() }) {
                    Text("Save")
                }
                
                if submit {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(receive ? "Subscribed": "Not subscribed")
                        Text("Emails: \(emailNumber)")
                        Text("Favorite: \(selection)")
                        Text("Date: \(date)")
                        Text("email: \(email)")
                        }.padding()
                }
            }
            .navigationBarTitle(Text("Settings"))
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
