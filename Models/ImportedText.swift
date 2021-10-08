//
//  ImportedText.swift
//  Readflix
//
//  Created by Zhenglong Wu on 04/10/2021.
//

import Foundation

struct ImportedText: Codable, Identifiable {
    
    var id = UUID()
    var texts: String
    var textName: String = "Document Scan"
    var dateCreated: Date

    init(texts: String, dateCreated: Date) {
        self.texts = texts
        self.dateCreated = dateCreated
    }
    
}
