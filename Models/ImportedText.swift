//
//  ImportedText.swift
//  Readflix
//
//  Created by Zhenglong Wu on 04/10/2021.
//

import Foundation

class ImportedText: Identifiable, Codable {
    
    var id = UUID()
    var texts: String
    var textName: String
    var dateCreated: Date

    init(texts: String, textName: String, dateCreated: Date) {
        self.texts = texts
        self.textName = textName
        self.dateCreated = dateCreated
    }
    
}

