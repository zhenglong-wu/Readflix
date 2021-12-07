//
//  FlashingMethod.swift
//  Readflix
//
//  Created by Zhenglong Wu on 15/11/2021.
//

import Foundation
import SwiftUI

class FlashingMethod: ObservableObject {
    
    // ID to identify specific instance of class for actions such as list deletion
    var id = UUID()
    
    var importedText: ImportedText
    
    init(importedText: ImportedText) {
        self.importedText = importedText
    }
    
    // Cache to store post-initialised value of tokenisedTextArray
    var tokenisedTextArrayCache: [String]?
    
    var tokenisedTextArray: [String] {
        get {
            return tokeniseTextByLength(input: importedText.texts, chunkLength: Int(chunkLength))
        }
    }
    
    // Unwraps optional value of cache and assigns to tokenisedTextArray
    func getComputedTokenisedTextArray() -> [String] {
        if let unwrappedTokenisedTextArray = tokenisedTextArrayCache {
            return unwrappedTokenisedTextArray
        }
        else{
            tokenisedTextArrayCache = tokeniseTextByLength(input: importedText.texts, chunkLength: Int(chunkLength))
            return tokenisedTextArrayCache!
        }
    }
    
    // Reading speed on FlashingSettingsView
    @Published var readingSpeedPerMinute: Double = 200  {
        didSet {
            readingSpeedPerSecond = roundToTwoDecimalPlacesDouble(input: 1/(Double(readingSpeedPerMinute)/Double(60)))
        }
    }
    
    func roundToTwoDecimalPlacesDouble(input: Double) -> Double {
        return Double(String(format: "%.2f", input))!
    }
    
    func roundToWholeNumberString(input: Double) -> String {
        return String(format: "%.0f", input)
    }
    
    // Internal calculated value for timer
    var readingSpeedPerSecond: Double = 1/(Double(200)/Double(60))
    
    @Published var chunkLength: Double = 1
    
    var isPausingAtPunctuation: Bool = true
    
    // 
    @Published var currentIndex: Int = 0 {
        didSet {
            if currentIndex > tokenisedTextArray.count {
                currentIndex = tokenisedTextArray.count-1
            }
        }
    }
    
    @Published var fontSize: CGFloat = 15.0
    
    @Published var textColour: Color = .black
    
    func incrementIndex() {
        self.currentIndex += 1
    }
    
    func tokeniseText() {
            
        var outputArray: [String] = []
        var tempArray: [String] = [String]()
        var tempString: String = ""
        
        tempArray.append(contentsOf: importedText.texts.components(separatedBy: " "))
        
        for i in stride(from: 0, through: ((tempArray.count-Int(chunkLength))-1), by: Int(chunkLength)) {
            for j in i...(i+Int(chunkLength)-1) {
                if j < (i+Int(chunkLength)-1) {
                    tempString += String(tempArray[j] + " ")
                }
                else {
                    tempString += tempArray[j]
                }
            }
            outputArray.append(tempString)
            tempString = ""
        }
    }
    
    
    // Takes in string and returns an array of indiviual words within the string separated by spaces to desired length
    func tokeniseTextByLengthFunction() -> [String] {
        
        var tempArray: [String] = [String]()
        var outputArray: [String] = [String]()
        tempArray.append(contentsOf: importedText.texts.components(separatedBy: " "))
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
        
        if tempArray.count % Int(chunkLength) != 0 {
            for j in (tempArray.count-(tempArray.count % Int(chunkLength)))...tempArray.count-1 {
                if j == tempArray.count-1 {
                    tempString.append(tempArray[j])
                    //print("tempString \(tempString)")
                    outputArray.append(tempString)
                    //print("tempArray \(outputArray)")
                }
                else {
                    tempString.append(tempArray[j] + " ")
                    //print("\(tempString)")
                }
            }
        }
        
        return outputArray
    }
    
    // Takes in string and returns an array of indiviual words within the string separated by spaces to desired length
    func tokeniseTextByLength(input: String, chunkLength: Int) -> [String] {
        
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
                    //print("tempString \(tempString)")
                    outputArray.append(tempString)
                    //print("tempArray \(outputArray)")
                }
                else {
                    tempString.append(tempArray[j] + " ")
                    //print("\(tempString)")
                }
            }
        }
        
        return outputArray
    }

}


