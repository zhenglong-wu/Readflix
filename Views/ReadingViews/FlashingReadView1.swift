//
//  FlashingReadView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 19/11/2021.
//

import SwiftUI
import ReadflixTests

struct FlashingReadView: View {

    
    var flashingMethod: FlashingMethod = FlashingMethod(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date()), importedTextIsTrue: true)
    
    var body: some View {

        VStack {
            Button {
                flashingMethod.startTimer()
            } label: {
                Text("Start timer")
            }
            Text(flashingMethod.readingSpeedPerMinute[flashingMethod.currentIndex])
            Button {
                flashingMethod.stopTimer()
            } label : {
                Text("Stop timer")
            }
        }

    }

}

struct FlashingReadView_Previews: PreviewProvider {
    static var previews: some View {
        FlashingReadView()
    }
}
