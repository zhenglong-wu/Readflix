//
//  ImportTextViewte.swift
//  Readflix
//
//  Created by Zhenglong Wu on 02/10/2021.
//

import SwiftUI

struct ImportTextView: View {
    
    @State private var showPasteTextView = false
    @EnvironmentObject private var state: ImportedTextFileStateController
    @EnvironmentObject private var statisticsStateController: StatisticsStateController
    
    let hapticsManager = HapticsManager()
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                if state.texts[1].count > 0 {
                    List{
                        ForEach(state.texts[1]) { text in
                            NavigationLink(
                                destination: BrowseImportedTextView(importedText: text),
                                label: {
                                    Text(text.textName)
                                }   
                            )
                        }
                        .onDelete(perform: deleteText)
                    }
                    .onAppear(perform: {
                        print("code hit")
                        state.saveToFile()
                    })
                }
                else {
                    VStack(spacing: 20) {
                        Text("We couldn't find any scanned documents..").bold()
                        Text("Scan some by tapping the ") + Text(Image(systemName: "character.textbox")).bold().foregroundColor(.blue) + Text(" button up top!")
                    }

                }
            }
            .navigationTitle("Import Text")
            .navigationBarItems(trailing: Button(action: {
               self.showPasteTextView = true
            }, label: {
                Text(Image(systemName: "character.textbox"))
                    .font(.title2)
                    .bold()
            })
            .sheet(isPresented: $showPasteTextView, content: {
                createPasteTextView()
            }))
        }
    }
    
    func createPasteTextView() -> PasteTextView {
        
        // Declare new tuple variable
        var newText: (String, String) = ("", "")
        // Pass tuple into PasteTextView
        let newPasteTextView = PasteTextView(save: { (pastedText: (String, String)) in
            newText = pastedText
            // Create new imported text and append to state array
            createNewTextAndAppendToViewTextArray(textFromPastedView: newText)
        })
        // Dismiss sheet view
        self.showPasteTextView = false   
        return newPasteTextView
    }
    
    func createNewTextAndAppendToViewTextArray(textFromPastedView: (String, String)) {
        let textName: String
        if textFromPastedView.0 == "" {
            textName = "Some Text"
        }
        else {
            textName = textFromPastedView.0
        }
        let text = textFromPastedView.1
        let newImportedText: ImportedText = ImportedText(texts: text, textName: textName, dateCreated: Date(), textType: "Raw text")
        self.state.addNewText(newText: newImportedText, appendToPosition: 1)
        self.statisticsStateController.statistics.contentLastAdded = "Raw text"
    }
    
    func deleteText(at offsets: IndexSet) {
        hapticsManager.createHeavyHaptic()
        self.state.texts[1].remove(atOffsets: offsets)
    }
    
}

struct ImportTextView_Previews: PreviewProvider {
    static var previews: some View {
        ImportTextView()
            .environmentObject(ImportedTextFileStateController())
    }
}
