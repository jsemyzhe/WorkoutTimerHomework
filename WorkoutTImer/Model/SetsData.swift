//
//  SetsData.swift
//  WorkoutTImer
//
//  Created by Julia Semyzhenko on 8/1/22.
//

import Foundation
class Base {
    let defaults  = UserDefaults.standard
    
    static let shared = Base()
    struct SetInfo: Codable, Hashable {
        var exersiceName: String
        var exerciseTime: Int
        var restTime: Int
    }
    
    var sets: [SetInfo] {
        get {
            if let data = defaults.value(forKey: "name") as? Data {
                return try! PropertyListDecoder().decode([SetInfo].self, from: data)
            } else {
                return [SetInfo]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "name")
            }
        }
    }
    
    func saveSet(name: String, exerciseTime: Int, restTime: Int) {
        let set = SetInfo(exersiceName: name, exerciseTime: exerciseTime, restTime: restTime)
        sets.insert(set, at: 0)
    }
    
}
