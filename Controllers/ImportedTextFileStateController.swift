//
//  ImportedTextFileStateController.swift
//  Readflix
//
//  Created by Zhenglong Wu on 30/09/2021.fcan you 3x
//

import Foundation

class ImportedTextFileStateController: ObservableObject {
    
    @Published var texts: [[ImportedText]] = [[], [], [], [], []]
    // Index 0 - Imported Scans | Index 1 - Imported Texts | Index 2 - Imported Webscraped Texts | Index 3 - Imported PDF Texts | Index 4 - All Imported Texts
    
    init(){
        loadFromFile()
    }
    
    func loadFromFile() {
        
        if let loaded: [[ImportedText]] = FileManager.default.load(from: "importedTexts.json") {
            texts = loaded
        }
    }
    
    func saveToFile() {
        FileManager.default.save(to: "importedTexts.json", object: texts)
    }
    
    func addNewText(newText: ImportedText, appendToPosition: Int) {
        self.texts[appendToPosition].append(newText)
    }
    
    func addNewTextToUniversalIndex(newText: ImportedText) {
        self.texts[4].append(newText)
    }
    
    func getMostAddedContent() -> String {
        
        var indexArray: [Int] = []
        var returnResult: String = ""
        
        for i in 0...texts.count-2 {
            indexArray.append(texts[i].count)
        }
        
        if let max = indexArray.max() {
            if let index = indexArray.firstIndex(of: max) {
                if index == 0 {
                    returnResult = "Scans"
                }
                else if index == 1 {
                    returnResult = "Raw texts"
                }
                else if index == 2 {
                    returnResult = "Webpage"
                }
                else if index == 3 {
                    returnResult = "PDF"
                }
            }
            else {
                returnResult = "Could not unwrap optional"
            }
        }
        else {
            returnResult = "Could not unwrap optional"
        }
        
        return returnResult
    }
}
    


 
