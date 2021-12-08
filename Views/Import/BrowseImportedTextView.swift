//
//  BrowseImportedTextView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 05/12/2021.
//

import SwiftUI
import Foundation

struct BrowseImportedTextView: View {
    
    @EnvironmentObject private var state: ImportedTextFileStateController
    @Environment(\.presentationMode) var presentationMode
    
    @State var importedText: ImportedText

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text(importedText.textName)
                        .bold()
                        .font(.title2)
                        .padding(.bottom, 15)
                    
                    Text(importedText.textType)
                        .italic()
                        .padding(.bottom, 15)
                        .foregroundColor(.gray)
                    
                    Text(importedText.texts)
                }
                .padding()
            }
            
            
            Spacer()
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
                hapticFeedback.impactOccurred()
                self.state.addNewTextToUniversalIndex(newText: importedText)
            }, label: {
                ZStack {
                    HStack {
                        Spacer()
                        Text("Add")
                            .bold()
                            .foregroundColor(.white)
                            .font(.title3)
                            .padding(.top, 15)
                            .offset(y: 2)
                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                .background(.blue)
            })
            
        }
    }
}

struct BrowseImportedTextView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseImportedTextView(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date(), textType: "Raw text"))
    }
}
