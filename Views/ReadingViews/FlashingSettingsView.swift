//
//  FlashingSettingsView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 02/12/2021.
//

import SwiftUI

struct FlashingSettingsView: View {
    
    @EnvironmentObject var flashingMethod: FlashingMethod
    @Environment(\.presentationMode) var presentationMode
        
    var body: some View {
        VStack {
     
            Text(String(format: "%.0f", flashingMethod.readingSpeedPerMinute))

            Slider(
                value: $flashingMethod.readingSpeedPerMinute,
                in: 100...400,
                step: 1
            ) {
                Text("WPM")
            } minimumValueLabel: {
                Text("50")
            }   maximumValueLabel: {
                Text("400")
            }
            
//            Slider(
//                value: $flashingMethod.chunkLength,
//                in: 100...400,
//                step: 1
//            ) {
//                Text("WPM")
//            } minimumValueLabel: {
//                Text("50")
//            }   maximumValueLabel: {
//                Text("400")
//            }
        }
        .padding()
    }
}

struct FlashingSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashingSettingsView()
            .environmentObject(FlashingMethod(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date())))
    }
}
