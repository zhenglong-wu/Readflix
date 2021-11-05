//
//  WebScraper.swift
//  Readflix
//
//  Created by Zhenglong Wu on 04/11/2021.
//

import Foundation
import SwiftSoup

class WebScraper {
    
    func getParsedText(inputUrl: String) -> String {
        
        var parsedString: String = ""
        var characterArray: [Character] = []
        
        if let url = URL(string: inputUrl) {
            do {
                let html = try String(contentsOf: url)
                let parsedHtml = try SwiftSoup.parse(html)
                characterArray.append(contentsOf: try parsedHtml.select("p").text())
                for i in 0...characterArray.count-1 {
                    parsedString += String(characterArray[i])
                }
            }
            catch {
                print("Error")
            }
        }
        print(parsedString)
        return parsedString
    }
    
}
