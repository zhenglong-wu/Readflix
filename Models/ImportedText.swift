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
    var textName: String
    var dateCreated: Date

    init(texts: String, textName: String, dateCreated: Date) {
        self.texts = texts
        self.textName = textName
        self.dateCreated = dateCreated
    }
    
    #if DEBUG
    
    static let testData = ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", textName: "Test Text", dateCreated: Date())
    
    #endif

}
