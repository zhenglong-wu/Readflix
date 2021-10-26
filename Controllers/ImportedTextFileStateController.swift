//
//  ImportedTextFileStateController.swift
//  Readflix
//
//  Created by Zhenglong Wu on 30/09/2021.fcan you 3x
//

import Foundation

class ImportedTextFileStateController: ObservableObject {
    
    @Published var texts: [ImportedText] = []
    
    init(){
        loadFromFile()
    }
    
    func loadFromFile() {
        
        if let loaded: [ImportedText] = FileManager.default.load(from: "importedTexts.json") {
            texts = loaded
        }
    }
    
    func saveToFile() {
        FileManager.default.save(to: "importedTexts.json", object: texts)
    }
}
