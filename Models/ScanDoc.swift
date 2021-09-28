//
//  ScanDoc.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import Foundation

struct ScanDoc: Identifiable {
    
    var id = UUID()
    let content: String
    
    init(content: String) {
        self.content = content
    }
    
}

