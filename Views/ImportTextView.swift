//
//  ImportTextViewte.swift
//  Readflix
//
//  Created by Zhenglong Wu on 02/10/2021.
//

import SwiftUI

struct ImportTextView: View {
    
    @State private var text: [ImportedText] = []
    @State private var showPasteTextView = false
    @EnvironmentObject var documentStateController: FileStateController
    
    var body: some View {
        VStack {
            if text.count > 0 {
                List{
                    ForEach(text) { text in
                        NavigationLink(
                            destination: ScrollView{Text(text.texts)},
                            label: {
                                Text(text.textName)
                            }
                        )
                            //.onAppear(perform: displayDocumentAlert())
                    }
                }
                .onAppear(perform: { documentStateController.saveToFile()})
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
                .font(.title)
        })
        .sheet(isPresented: $showPasteTextView, content: {
            createPasteView()
        }))
    }
    
    func createPasteView() -> PasteTextView {
        var newText: String = ""
        let newPasteView = PasteTextView(save: { (pastedText: String) in
            newText = pastedText
            createNewTextAndAppendToViewTexArray(textFromPastedView: newText)
            
        })
        self.showPasteTextView = false
        return newPasteView
    
    }
    
    func createNewTextAndAppendToViewTexArray(textFromPastedView: String) {
        let newImportedText: ImportedText = ImportedText(texts: textFromPastedView, dateCreated: Date())
        self.text.append(newImportedText)
    }
    
}

struct ImportTextView_Previews: PreviewProvider {
    static var previews: some View {
        ImportTextView()
    }
}
