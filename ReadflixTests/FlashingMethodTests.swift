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
        
        let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        let importedText = ImportedText(texts: text, textName: "Lorem Ipsum", dateCreated: Date(), textType: "Raw text")
        
        let flashingMethod = FlashingMethod(importedText: importedText)
        
        let testData = [(data: importedText.texts, expected: ["Lorem ipsum", "dolor sit", "amet, consectetur", "adipiscing elit,", "sed do", "eiusmod tempor", "incididunt ut", "labore et", "dolore magna", "aliqua."], chunkLength: 2),
                        (data: importedText.texts, expected: ["Lorem ipsum dolor sit amet,", "consectetur adipiscing elit, sed do", "eiusmod tempor incididunt ut labore", "et dolore magna aliqua."], chunkLength: 5),
                        (data: importedText.texts, expected: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit,", "sed do eiusmod tempor incididunt ut labore et", "dolore magna aliqua."], chunkLength: 8)]
        
        for test in testData {
            let result = flashingMethod.tokeniseTextByLength(input: test.data, chunkLength: test.chunkLength)
            XCTAssertEqual(result, test.expected)
        }
        
    }
    
    func testIncrementIndex() {
        
        let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        let importedText = ImportedText(texts: text, textName: "Lorem Ipsum", dateCreated: Date(), textType: "Raw text")
        
        let flashingMethod = FlashingMethod(importedText: importedText)
        
        flashingMethod.incrementIndex()
        
        XCTAssertEqual(flashingMethod.currentIndex, 1)

    }

    func testRoundToWholeNumberString() {
        
        let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        let importedText = ImportedText(texts: text, textName: "Lorem Ipsum", dateCreated: Date(), textType: "Raw text")
        
        let flashingMethod = FlashingMethod(importedText: importedText)
        
        let testData: Double = 3.14159265359
        
        XCTAssertEqual("3", flashingMethod.roundToWholeNumberString(input: testData))
    }
    
    func testRoundToTwoDecimalPlaces() {
            
        let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        let importedText = ImportedText(texts: text, textName: "Lorem Ipsum", dateCreated: Date(), textType: "Raw text")
        
        let flashingMethod = FlashingMethod(importedText: importedText)
        
        
        let testData: Double = 3.14159265359
        
        XCTAssertEqual(3.14, flashingMethod.roundToTwoDecimalPlacesDouble(input: testData))
    }
    
}



