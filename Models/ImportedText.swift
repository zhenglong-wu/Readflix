//
//  ImportedText.swift
//  Readflix
//
//  Created by Zhenglong Wu on 04/10/2021.
//

import Foundation
import CoreData

class ImportedText: Identifiable, Codable {
    
    // Unique identification
    var id = UUID()
    // String of imported text
    var texts: String
    // Name of imported text
    var textName: String
    // Time created of imported text
    var dateCreated: Date
    // Text type created from
    var textType: String

    init(texts: String, textName: String, dateCreated: Date, textType: String) {
        self.texts = texts
        self.textName = textName
        self.dateCreated = dateCreated
        self.textType = textType
    }
    
}

