//
//  FlashingMethod.swift
//  Readflix
//
//  Created by Zhenglong Wu on 15/11/2021.
//

import Foundation

class FlashingMethod: ObservableObject {
    
    // ID to identify specific instance of class for actions such as list deletion
    var id = UUID()
    
    var importedText: ImportedText
    
    init(importedText: ImportedText) {
        self.importedText = importedText
    }
    
    var tokenisedTextArrayCache: [String]?
    
    var tokenisedTextArray: [String] {
        get {
            return tokeniseTextByLength(input: importedText.texts, chunkLength: chunkLength)
        }
    }
    
    func getComputedTokenisedTextArray() -> [String] {
        if let unwrappedTokenisedTextArray = tokenisedTextArrayCache {
            return unwrappedTokenisedTextArray
        }
        else{
            tokenisedTextArrayCache = tokeniseTextByLength(input: importedText.texts, chunkLength: chunkLength)
            return tokenisedTextArrayCache!
        }
    }
    
    var readingSpeedPerMinute: Int = 200  {
        didSet {
            readingSpeedPerSecond = Double(String(format: "%.2f", 1/(Double(readingSpeedPerMinute)/Double(60))))!
        }
    }
    
    var readingSpeedPerSecond: Double = 1/(Double(200)/Double(60))
    
    var chunkLength: Int = 1
    
    @Published var currentIndex: Int = 0 {
        didSet {
            if currentIndex > tokenisedTextArray.count {
                currentIndex = tokenisedTextArray.count-1
            }
        }
    }
    
    func incrementIndex() {
        self.currentIndex += 1
    }
    
    func tokeniseText() {
            
        var outputArray: [String] = []
        var tempArray: [String] = [String]()
        var tempString: String = ""
        
        tempArray.append(contentsOf: importedText.texts.components(separatedBy: " "))
        
        for i in stride(from: 0, through: ((tempArray.count-chunkLength)-1), by: chunkLength) {
            for j in i...(i+chunkLength-1) {
                if j < (i+chunkLength-1) {
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
        
        if tempArray.count % chunkLength != 0 {
            for j in (tempArray.count-(tempArray.count % chunkLength))...tempArray.count-1 {
                if j == tempArray.count-1 {
                    tempString.append(tempArray[j])
                    print("tempString \(tempString)")
                    outputArray.append(tempString)
                    print("tempArray \(outputArray)")
                }
                else {
                    tempString.append(tempArray[j] + " ")
                    print("\(tempString)")
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
                    print("tempString \(tempString)")
                    outputArray.append(tempString)
                    print("tempArray \(outputArray)")
                }
                else {
                    tempString.append(tempArray[j] + " ")
                    print("\(tempString)")
                }
            }
        }
        
        return outputArray
    }

}


