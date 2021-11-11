//
//  InputPdf.swift
//  Readflix
//
//  Created by Zhenglong Wu on 09/11/2021.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct InputPdf: FileDocument {
    
    static var readableContentTypes: [UTType] {
        [.pdf]
    }

    var input: String

    init(input: String) {
        self.input = input
    }

    init(configuration: FileDocumentReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        input = string
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: input.data(using: .utf8)!)
    }

}


