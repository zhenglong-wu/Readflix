//
//  WebScraper.swift
//  Readflix
//
//  Created by Zhenglong Wu on 04/11/2021.
//

import Foundation
import SwiftSoup

class WebParser {
    
    // Takes in url as parameter and parses html file, and returns all descriptive text in "<p>" tags as string
    func getParsedTextFromUrl(inputUrl: String) -> String {
        
        var parsedString: String = ""
        var characterArray: [Character] = []
        
        // Uwnrapping url
        if let url = URL(string: inputUrl) {
            do {
                // Converts HTML content from URL into string
                let html = try String(contentsOf: url)
                // Parses and groups divs, containers from HTML as string
                let parsedHtml = try SwiftSoup.parse(html)
                // Appends all HTML elements with 'p' tag into characterArray
                characterArray.append(contentsOf: try parsedHtml.select("p").text())
                // Loops to append all contents of characterArray to a string
                for i in 0...characterArray.count-1 {
                    parsedString += String(characterArray[i])
                }
            }
            catch {
                print("Error")
            }
        }
        else {
            print("Error")
        }
        print(parsedString)
        return parsedString
    }
    
    // Verifies if URL is accessible and returns boolean
    func verifyUrl(url: String?) -> Bool {
        if let url = url {
            if let url = NSURL(string: url) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    

    
}
