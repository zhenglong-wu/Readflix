//
//  Statistics.swift
//  Readflix
//
//  Created by Zhenglong Wu on 07/12/2021.
//

import Foundation

class Statistics: Codable, ObservableObject {
    
    var totalWordsRead: Int = 0
    
    var wordsReadToday: Int = 0
    
    var contentLastAdded: String = ""
    
    var mostContentAdded: String = ""
    
    func addToTotalWordsRead(number: Int, chunkLength: Int) {
        self.totalWordsRead += number * chunkLength
    }
    
}
