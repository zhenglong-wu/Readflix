//
//  FlashingMethodFileStateController.swift
//  Readflix
//
//  Created by Zhenglong Wu on 25/11/2021.
//

import Foundation

class FlashingMethodFileStateController: ObservableObject {
    
    @Published var flashingMethodTexts: [[FlashingMethod]] = []
    
    init(){
        loadFromFile()
    }
    
    func loadFromFile() {
        
        if let loaded: [[FlashingMethod]] = FileManager.default.load(from: "flashingMethod.json") {
            flashingMethodTexts = loaded
        }
    }
    
    func saveToFile() {
        FileManager.default.save(to: "flashingMethod.json", object: flashingMethodTexts)
    }
    
    func addNewText(newText: ImportedText, appendToPosition: Int) {
        self.flashingMethodTexts[appendToPosition].append(newText)
    }
}
