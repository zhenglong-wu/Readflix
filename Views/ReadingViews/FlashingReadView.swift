//
//  FlashingReadView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 29/11/2021.
//

import SwiftUI

struct FlashingReadView: View {
    
    @EnvironmentObject var flashingMethod: FlashingMethod
    
    @State var timerHasStarted = false
    @State var hasReachedEnd = false
    @State var currentText: String = ""
    @State var isShowingSettingsSheet = false
    @State var hasCompletedSettings: Bool = false {
        didSet {
            changeTimer()
            self.hasCompletedSettings = false
        }
    }
    
    @State var timer = Timer.publish(every: 1/(Double(200)/Double(60)), on: .main, in: .common).autoconnect()
    
    var timerValue: Double {
        get{
            return flashingMethod.readingSpeedPerSecond
        }
    }
    
    var body: some View {

        VStack {
            
            Spacer()
            
            Text(currentText)
                .onReceive(self.timer, perform: { time in
                    if flashingMethod.currentIndex == flashingMethod.tokenisedTextArray.count-1 {
                        self.timerHasStarted = false
                        self.hasReachedEnd = true
                    }
                    else {
                        if self.timerHasStarted == true {
                            flashingMethod.incrementIndex()
                            currentText = flashingMethod.tokenisedTextArray[flashingMethod.currentIndex]
                            if flashingMethod.isPausingAtPunctuation == true {
                                if currentText.contains(".") == true {
                                    self.timerHasStarted = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        self.timerHasStarted = true
                                    }
                                }
                                else if currentText.contains(",") {
                                    self.timerHasStarted = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        self.timerHasStarted = true
                                    }
                                }
                                else if currentText.contains(";") {
                                    self.timerHasStarted = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        self.timerHasStarted = true
                                    }
                                }
                            }
                        }
                    }
                })
            
            Spacer()
            
            HStack(alignment: .bottom) {
  
                HStack() {
                    
                    Button(action: {
                        self.timerHasStarted = false
                        self.isShowingSettingsSheet.toggle()
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.largeTitle)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        flashingMethod.currentIndex -= 1
                        currentText = flashingMethod.tokenisedTextArray[flashingMethod.currentIndex]
                    }, label: {
                        Image(systemName: "backward.circle")
                            .font(.largeTitle)
                    })
                    
                    Button(action: {
                        self.timerHasStarted.toggle()
                    }, label: {
                        Image(systemName: self.timerHasStarted ? "pause.circle" : "play.circle")
                            .font(.largeTitle)
                    })
                    Button(action: {
                        flashingMethod.currentIndex += 1
                        currentText = flashingMethod.tokenisedTextArray[flashingMethod.currentIndex]
                    }, label: {
                        Image(systemName: "forward.circle")
                            .font(.largeTitle)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        flashingMethod.currentIndex = 0
                        currentText = flashingMethod.tokenisedTextArray[flashingMethod.currentIndex]
                        self.hasReachedEnd = false
                    }, label: {
                        Image(systemName: "gobackward")
                            .font(.largeTitle)
                    })
                        .disabled(!hasReachedEnd)
                }
                
            }
            .padding()
            
//            FlashingSettingsView(showSheet: $isShowingSettingsSheet)
//                .padding(.top, 300)
//                .offset(y: isShowingSettingsSheet ? 0 : UIScreen.main.bounds.height)
//                .animation(.spring())
        }
        .sheet(isPresented: $isShowingSettingsSheet, content: {
            FlashingSettingsView(settingsCompletion: $hasCompletedSettings)
        })
        

    }
    
    func changeTimer() {
        timer = Timer.publish(every: flashingMethod.readingSpeedPerSecond, on: .main, in: .common).autoconnect()
    }
    
}

//struct FlashingReadView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlashingReadView(hasCompletedSettings: <#Binding<Bool>#>)
//            .environmentObject(FlashingMethod(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date())))
//    }
//}

