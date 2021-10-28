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
    
    var body: some View {
        VStack {
            if state.texts[1].count > 0 {
                List{
                    ForEach(state.texts[1]) { text in
                        NavigationLink(
                            destination: ScrollView{Text(text.texts)},
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
            Image(systemName: "doc.text")
                .font(.title2)
        })
        .sheet(isPresented: $showPasteTextView, content: {
            createPasteView()
        }))
    }
    
    func createPasteView() -> PasteTextView {
        var newText: (String, String) = ("", "")
        let newPasteView = PasteTextView(save: { (pastedText: (String, String)) in
            newText = pastedText
            createNewTextAndAppendToViewTextArray(textFromPastedView: newText)
        })
        self.showPasteTextView = false   
        return newPasteView
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
        let newImportedText: ImportedText = ImportedText(texts: text, textName: textName, dateCreated: Date())
        self.state.addNewText(newText: newImportedText, appendToPosition: 1)
    }
    
    func deleteText(at offsets: IndexSet) {
        self.state.texts[1].remove(atOffsets: offsets)
    }
    
}

struct ImportTextView_Previews: PreviewProvider {
    static var previews: some View {
        ImportTextView()
            .environmentObject(ImportedTextFileStateController())
    }
}
