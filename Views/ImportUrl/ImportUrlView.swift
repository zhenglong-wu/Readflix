//
//  ImportUrlView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 02/10/2021.
//

import SwiftUI
import SwiftSoup

struct ImportUrlView: View {
    
    @State private var showPasteUrlView = false
    @EnvironmentObject private var state: ImportedTextFileStateController
    
    let webScraper = WebScraper()
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                if state.texts[2].count > 0 {
                    List{
                        ForEach(state.texts[2]) { text in
                            NavigationLink(
                                destination: ScrollView{
                                    Text(text.texts)
                                        .padding(20)
                                },
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
                    Text("No webscraped texts...")
                    Text("\n")
                    Text("You can get online text by tapping the top right button!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Import URL")
            .navigationBarItems(trailing: Button(action: {
               self.showPasteUrlView = true
            }, label: {
                Image(systemName: "network")
                    .font(.title2)
            })
            .sheet(isPresented: $showPasteUrlView, content: {
                createPasteUrlView()
            }))
        }
    }
    
    func createPasteUrlView() -> PasteUrlView {
        var newText: (String, String) = ("", "")
        let newPasteUrlView = PasteUrlView(save: { (pastedText: (String, String)) in
            newText = pastedText
            createNewTextFromUrlAndAppendToViewTextArray(urlFromPasteView: newText)
        })
        self.showPasteUrlView = false
        return newPasteUrlView
    }
    
    func createNewTextFromUrlAndAppendToViewTextArray(urlFromPasteView: (String, String)) {
        let textName: String
        if urlFromPasteView.0 == "" {
            textName = "Some Text"
        }
        else {
            textName = urlFromPasteView.0
        }
        let text = webScraper.getParsedText(inputUrl: urlFromPasteView.1)
        let newImportedText: ImportedText = ImportedText(texts: text, textName: textName, dateCreated: Date())
        self.state.addNewText(newText: newImportedText, appendToPosition: 2)
        
    }
    
    func deleteText(at offsets: IndexSet) {
        self.state.texts[2].remove(atOffsets: offsets)
    }
}

struct ImportUrlView_Previews: PreviewProvider {
    static var previews: some View {
        ImportUrlView()
    }
}
