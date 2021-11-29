//
//  FlashingReadView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 29/11/2021.
//

import SwiftUI

struct FlashingReadView: View {
    
    var flashingMethod: FlashingMethod = FlashingMethod(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date()))
    
    var body: some View {

        VStack {
            Button {
                flashingMethod.startTimer()
            } label: {
                Text("Start timer")
            }
            Button {
                flashingMethod.stopTimer()
            } label : {
                Text("Stop timer")
            }
        }
        .onAppear(perform: {
            flashingMethod.updateTokenisedTextArray()
            print(flashingMethod.tokenisedTextArray)
        })

    }
    
}

struct FlashingReadView_Previews: PreviewProvider {
    static var previews: some View {
        FlashingReadView()
    }
}
