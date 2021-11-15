//
//  PdfScraper.swift
//  Readflix
//
//  Created by Zhenglong Wu on 12/11/2021.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct PdfScraper: FileDocument {
    
    // Declares what file types to read from
    static var readableContentTypes: [UTType] {
        [.pdf]
    }

    var input: String

    init(input: String) {
        self.input = input
    }
    
    // Initialises FileDocument configuration and converts content into string
    init(configuration: FileDocumentReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        input = string
    }
    
    // Provides a link to the system file directory system
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: input.data(using: .utf8)!)
    }
    
}




