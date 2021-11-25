//
//  FlashingReadView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 19/11/2021.
//

import SwiftUI

struct FlashingReadView: View {
    
    var flashingMethod: FlashingMethod = FlashingMethod(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date()))
    
    var body: some View {
        VStack {
            Button {
                startTimer()
            } label: {
                Text("Start timer")
            }
            Text(flashingMethod.currentText)
            Button {
                stopTimer()
            } label: {
                Text("Stop timer")
            }
        }
        .onReceive(flashingMethod.timer, perform: {
            for i in 0...flashingMethod.tokenisedTextArray.count-1 {
                flashingMethod.currentText = flashingMethod.tokenisedTextArray[i]
            }
        })
    }
    
    func startTimer() {
        flashingMethod.startTimer()
    }
    
    func stopTimer() {
        flashingMethod.stopTimer()
    }
    
}

struct FlashingReadView_Previews: PreviewProvider {
    static var previews: some View {
        FlashingReadView()
    }
}
