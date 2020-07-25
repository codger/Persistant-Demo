//
//  HelloStarWorld.swift
//  Persistant Demo
//
//  Created by John James Retina on 7/23/20.
//

import SwiftUI

struct HelloStarWorld: View {
  @ObservedObject var userSettings = UserSettings()
  
  var body: some View {
    HStack{
      (Text("Hello,") + Text(Image(systemName: "star")) + Text("World!") )
        .font(.largeTitle)
        .foregroundColor(.red)
    }.navigationTitle(userSettings.username)
  }
}

struct HelloStarWorld_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView{
      HelloStarWorld()
    }
  }
}
