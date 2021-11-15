//
//  ePubParser.swift
//  Readflix
//
//  Created by Zhenglong Wu on 12/11/2021.
//

import Foundation
import SwiftUI
import ZIPFoundation
import Bookbinder
import UniformTypeIdentifiers

//struct ePubScraper: FileDocument {
//
//    static var readableContentTypes: [UTType] {
//        [.epub]
//    }
//
//    let bookBinder = Bookbinder()
//
//    var parsedText: String
//
//    init(parsedText: String) {
//        self.parsedText = parsedText
//    }
//
//    init(configuration: FileDocumentConfiguration) throws {
//
//        guard let data = configuration.file.regularFileContents,
//                let eBook = bookBinder.bindBook(at: data)
//        else {
//            print("TODO")
//        }
//    }
//
//}


struct PdfScraper1: FileDocument {

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
