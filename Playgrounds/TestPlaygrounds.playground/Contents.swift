
import UIKit
import SwiftSoup

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
            characterArray.append(contentsOf: try parsedHtml.select("div").text())
            // Loops to append all contents of characterArray to a string
            for i in 0...characterArray.count-1 {
                parsedString += String(characterArray[i])
            }
        }
        catch {
            print("Error")
        }
    }
    return parsedString
}

print(getParsedTextFromUrl(inputUrl: "https://www.quantconnect.com/tutorials/introduction-to-options/the-greek-letters"))




