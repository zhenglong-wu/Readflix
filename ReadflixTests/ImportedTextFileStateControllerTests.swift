//
//  ImportedTextFileStateControllerTests.swift
//  ReadflixTests
//
//  Created by Zhenglong Wu on 22/01/2022.
//

import XCTest
@testable import Readflix

class ImportedTextFileStateControllerTests: XCTestCase {

    func testAddNewTextReturnsNewLengthOfStorageArray() {
        
        let importedTextFileStateController = ImportedTextFileStateController()
        
        let testData = ImportedText(texts: "Lorem ipsum", textName: "Lorem Ipsum", dateCreated: Date(), textType: "Raw text")
        
        importedTextFileStateController.addNewText(newText: testData, appendToPosition: 0)
        
        XCTAssertEqual(importedTextFileStateController.texts[0].count, 1)
    }
    
    func testAddNewTextReturnsNewLengthOfUniversalStorageArray() {
        
        let importedTextFileStateController = ImportedTextFileStateController()
        
        let testData = ImportedText(texts: "Lorem ipsum", textName: "Lorem Ipsum", dateCreated: Date(), textType: "Raw text")
        
        importedTextFileStateController.addNewTextToUniversalIndex(newText: testData)
        
        XCTAssertEqual(importedTextFileStateController.texts[4].count, 1)
    }

}

