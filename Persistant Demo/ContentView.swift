//
//  ContentView.swift
//  Persistant Demo
//
//  Created by John James Retina on 7/18/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("Username", text: $userSettings.username)
                    Toggle(isOn: $userSettings.isPrivate) {
                        Text("Private Account")
                    }
                    Picker(selection: $userSettings.ringtone, label: Text("Ringtone")) {
                        ForEach(userSettings.ringtones, id: \.self) { ringtone in
                            Text(ringtone)
                        }
                    }
                  Text("\(userSettings.counter)")
                  HStack{
                    Button("Inc") {
                      userSettings.incrementCounter()
                    }
                    Spacer()
                    Button("Dec") {
                      userSettings.deccrementCounter()
                    }
                  }.padding()
                  .buttonStyle(FilledButton())
                }
            }
            .navigationBarTitle("Settings") 
        }
    }
}

struct FilledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
