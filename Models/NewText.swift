//
//  NewText.swift
//  Readflix
//
//  Created by Zhenglong Wu on 14/10/2021.
//

import Foundation

class NewText: ObservableObject {
    
    @Published var newTexts: String
    
    init(newTexts: String) {
        self.newTexts = newTexts
    }
}
