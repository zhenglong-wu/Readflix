//
//  ImportedText.swift
//  Readflix
//
//  Created by Zhenglong Wu on 04/10/2021.
//

import Foundation
import CoreData

class ImportedText: Identifiable, Codable {
    
    var id = UUID()
    var texts: String
    var textName: String
    var dateCreated: Date
    var textType: String

    init(texts: String, textName: String, dateCreated: Date, textType: String) {
        self.texts = texts
        self.textName = textName
        self.dateCreated = dateCreated
        self.textType = textType
    }
}

