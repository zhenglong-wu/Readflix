//
//  FileManagerTests.swift
//  ReadflixTests
//
//  Created by Zhenglong Wu on 04/11/2021.
//

import XCTest
@testable import Readflix

class FileManagerTests: XCTestCase {

    func testEncodeToJsonReturnsJson() {
        
        let fileManager = FileManager()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:SS"
        let dateCreated = dateFormatter.date(from: "2021/11/04 19:31:32")

        let testData = ImportedText(texts: "Lorem ipsum", textName: "Lorem Ipsum", dateCreated: dateCreated!)
        
        let expected: String = "{\"id\":\"\(testData.id)\",\"texts\":\"Lorem ipsum\",\"dateCreated\":657747060.31999993,\"textName\":\"Lorem Ipsum\"}"
        
        let result = fileManager.encodeToJson(object: testData)
        
        
        XCTAssertEqual(result, expected)
        
    }

}


