//
//  FlashingMethod.swift
//  Readflix
//
//  Created by Zhenglong Wu on 15/11/2021.
//

import Foundation

class FlashingMethod {
    
    var readingTextArray: [String] = []
    
    var id = UUID()
    var importedText: ImportedText {
        didSet {
            tokenisedTextArray = tokeniseTextByLength()
        }
    }
    
    // How many words read per minute
    var readingWordsPerMinute: Int = 200 {
        didSet {
            readingWordsPerSecond = Double(String(format: "%.2f", 1/(Double(readingWordsPerMinute)/Double(60))))!
        }
    }
    // How many words read per second, used for timer
    var readingWordsPerSecond: Double = 1/(Double(200)/Double(60)) {
        didSet {
            timer = Timer.publish(every: readingWordsPerSecond, on: .main, in: .common).autoconnect()
        }
    }
    // How lengthy a displayed chunk of text is
    var chunkLength: Int = 1
    
    var tokenisedTextArray: [String] = [String]()
    
    var currentText: String = ""
        
    init(importedText: ImportedText) {
        self.importedText = importedText
    }
    
    var timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: readingWordsPerSecond, on: .main, in: .common).autoconnect()
    }
    
    // DEPRECATED FUNCTION!
    // Takes in string and returns an array of indiviual words within the string separated by spaces
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
    func tokeniseTextByLength() -> [String] {
        
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
    func tokeniseTextByLengthReturnsStringArray(input: String, chunkLength: Int) -> [String] {
        
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


