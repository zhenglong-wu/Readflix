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
    @StateObject var newText: NewText = NewText(newTexts: "")
    
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
                //.onAppear(perform: { documentState.saveToFile()})
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
    
    private func createPasteView() -> PasteTextView {
        var newPasteView = PasteTextView(passedData: newText)
        self.text.append(ImportedText(texts: newText.newTexts, dateCreated: Date()))
        self.showPasteTextView = false
        return newPasteView
        
//        var newPasteview = PasteTextView(passedData: newText)
//        self.text.append(ImportedText(texts: newText.newText, dateCreated: Date()))can you
//        self.showPasteTextView = false
//        self.newText.newText = ""
//        return newPasteview
    }
    
}

struct ImportTextView_Previews: PreviewProvider {
    static var previews: some View {
        ImportTextView()
    }
}
