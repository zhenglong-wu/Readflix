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
                    .onAppear(perform: { state.saveToFile()})
                }
                else {
                    Text("No imported texts...")
                    Text("\n")
                    Text("You can paste your own text by tapping the top right button!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Import Text")
            .navigationBarItems(trailing: Button(action: {
               self.showPasteTextView = true
            }, label: {
                Image(systemName: "abc")
                    .font(.title2)
            })
            .sheet(isPresented: $showPasteTextView, content: {
                createPasteTextView()
            }))
        }
    }
    
    func createPasteTextView() -> PasteTextView {
        var newText: (String, String) = ("", "")
        let newPasteTextView = PasteTextView(save: { (pastedText: (String, String)) in
            newText = pastedText
            createNewTextAndAppendToViewTextArray(textFromPastedView: newText)
        })
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
