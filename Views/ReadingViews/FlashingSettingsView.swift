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
    
    @Binding var settingsCompletion: Bool
    
    let hapticsManager = HapticsManager()
        
    var body: some View {
        
        NavigationView {
            VStack {
                
                Toggle("Pause at punctuation", isOn: $flashingMethod.isPausingAtPunctuation)
                    .padding()
                    .onTapGesture {
                        hapticsManager.createLightHaptic()
                    }
                
                HStack {
                    ColorPicker("Text colour", selection: $flashingMethod.textColour)
                        .padding()
                }
                
                VStack {
                    HStack {
                        Text("Speed")
                            .bold()
                        Spacer()
                        Text("\(flashingMethod.roundToWholeNumberString(input: flashingMethod.readingSpeedPerMinute)) words per minute")
                    }
                    Slider(
                        value: $flashingMethod.readingSpeedPerMinute,
                        in: 50...400,
                        step: 5
                    ) {
                        Text("WPM")
                    } minimumValueLabel: {
                        Text("50")
                    }   maximumValueLabel: {
                        Text("400")
                    }
                }
                .padding()
                
                VStack {
                    HStack {
                        Text("Chunk length")
                            .bold()
                        Spacer()
                        Text("\(flashingMethod.roundToWholeNumberString(input: flashingMethod.chunkLength)) word(s)")
                    }
                    Slider(
                        value: $flashingMethod.chunkLength,
                        in: 1...5,
                        step: 1
                    ) {
                        Text("Chunk Length")
                    } minimumValueLabel: {
                        Text("1")
                    }   maximumValueLabel: {
                        Text("5")
                    }
                }
                .padding()
                
                VStack {
                    HStack {
                        Text("Font Size")
                            .bold()
                        Spacer()
                    }
                    Slider(
                        value: $flashingMethod.fontSize,
                        in: 15...25,
                        step: 1
                    ) {
                        Text("Chunk Length")
                    } minimumValueLabel: {
                        Text("Aa")
                            .font(.subheadline)
                    }   maximumValueLabel: {
                        Text("Aa")
                            .font(.headline)
                    }
                }
                .padding()
                
                Button(action: {
                    hapticsManager.createSuccessHaptic()
                    self.settingsCompletion = true
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    VStack {
                        Text("Save")
                            .foregroundColor(.white)
                            .bold()
                            .padding(10)
                            .padding(.horizontal, 15)
                    }
                    .background(Color.blue)
                    .cornerRadius(18)
                })
                
            }
            .cornerRadius(20)
            .padding()
            .navigationTitle(Text("Reading Settings"))
        }
    
    }
}

//struct FlashingSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        FlashingSettingsView()
//            .environmentObject(FlashingMethod(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date())))
//    }
//}
