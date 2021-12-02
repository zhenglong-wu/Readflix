//
//  FlashingMethodTests.swift
//  ReadflixTests
//
//  Created by Zhenglong Wu on 18/11/2021.
//

import XCTest
@testable import Readflix

class FlashingMethodTests: XCTestCase {
    
    func testTokeniseTextByLength() {
        
        let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        
        let importedText = ImportedText(texts: text, textName: "Lorem Ipsum", dateCreated: Date())
        
        let flashingMethod = FlashingMethod(importedText: importedText)
        
        let testData = [(data: importedText.texts, expected: ["Lorem ipsum", "dolor sit", "amet, consectetur", "adipiscing elit,", "sed do", "eiusmod tempor", "incididunt ut", "labore et", "dolore magna", "aliqua. Ut", "enim ad", "minim veniam,", "quis nostrud", "exercitation ullamco", "laboris nisi", "ut aliquip", "ex ea", "commodo consequat."], chunkLength: 2),
                        (data: importedText.texts, expected: ["Lorem ipsum dolor sit amet,", "consectetur adipiscing elit, sed do", "eiusmod tempor incididunt ut labore", "et dolore magna aliqua. Ut", "enim ad minim veniam, quis", "nostrud exercitation ullamco laboris nisi", "ut aliquip ex ea commodo", "consequat."], chunkLength: 5), 
                        (data: importedText.texts, expected: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit,", "sed do eiusmod tempor incididunt ut labore et", "dolore magna aliqua. Ut enim ad minim veniam,", "quis nostrud exercitation ullamco laboris nisi ut aliquip", "ex ea commodo consequat."], chunkLength: 8)]
        
        for test in testData {
            let result = flashingMethod.tokeniseTextByLength(input: test.data, chunkLength: test.chunkLength)
            XCTAssertEqual(result, test.expected)
        }
        
    }

}



