//
//  User.swift
//  Readflix
//
//  Created by Zhenglong Wu on 23/11/2021.
//

import Foundation

class User: Identifiable, Codable {
    
    var firstName: String
    var lastName: String
    
    var currentReadingSpeed: Int
    var wordsReadLifeTme: Int
    
    init(firstName: String, lastName: String, currentReadingSpeed: Int, wordsReadLifeTime: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.currentReadingSpeed = 200
        self.wordsReadLifeTme = 0
    }
    
}
