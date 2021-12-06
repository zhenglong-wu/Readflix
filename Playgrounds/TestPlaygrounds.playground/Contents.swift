
import UIKit
import SwiftSoup

//Takes in url as parameter and parses html file, and returns all descriptive text in "<p>" tags as string
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

func testTokeniseByLengthVersionOne(input: String, chunkLength: Int) -> [String] {
    
    var outputArray: [String] = []
    var tempArray: [String] = [String]()
    var tempString: String = ""
    tempArray.append(contentsOf: input.components(separatedBy: " "))
    
    for i in stride(from: 0, through: ((tempArray.count-chunkLength)-1), by: chunkLength) {
        for j in i...(i+chunkLength-1) {
            
            if j < (i+chunkLength) {
                tempString += String(tempArray[j] + " ")
            }
            else {
                tempString += tempArray[j]
            }
        }
        outputArray.append(tempString)
        print(tempString)
        tempString = ""
    }
    
    return outputArray
}

func testTokeniseByLengthVersionTwo(input: String, chunkLength: Int) -> [String] {
    
    var tempArray: [String] = [String]()
    var outputArray: [String] = [String]()
    tempArray.append(contentsOf: input.components(separatedBy: " "))
    var tempString: String = ""
    var counter = chunkLength
    
    for i in 0...tempArray.count-1 {
        if counter == 1 {
            tempString.append(tempArray[i])
            counter -= 1
            outputArray.append(tempString)
            tempString = ""
            counter = chunkLength
        }
        else {
            tempString.append(tempArray[i] + " ")
            counter -= 1
        }
    }
    
    tempString = ""
    
    if tempArray.count % chunkLength != 0 {
        for j in (tempArray.count-(tempArray.count % chunkLength))...tempArray.count-1 {
            if j == tempArray.count-1 {
                tempString.append(tempArray[j])
                outputArray.append(tempString)
            }
            else {
                tempString.append(tempArray[j] + " ")
            }
        }
    }
    
    return outputArray
}




 
