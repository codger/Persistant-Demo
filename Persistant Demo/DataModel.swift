//
//  DataModel.swift
//  Persistant Demo
//
//  Created by John James Retina on 7/18/20.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    @Published var isPrivate: Bool {
        didSet {
            UserDefaults.standard.set(isPrivate, forKey: "isAccountPrivate")
        }
    }
    
    @Published var ringtone: String {
        didSet {
            UserDefaults.standard.set(ringtone, forKey: "ringtone")
        }
    }
  
  @Published var counter: Int {
      didSet {
          UserDefaults.standard.set(counter, forKey: "counter")
      }
  }
    
    public var ringtones = ["Chimes", "Signal", "Waves"]
    
    init() {
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.isPrivate = UserDefaults.standard.object(forKey: "isAccountPrivate") as? Bool ?? true
        self.ringtone = UserDefaults.standard.object(forKey: "ringtone") as? String ?? "Chimes"
        self.counter = UserDefaults.standard.integer(forKey: "counter")
    }
  
  func incrementCounter()  {
    self.counter += 1
  }
  func deccrementCounter()  {
    self.counter -= 1
  }
}
