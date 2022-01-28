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
    @EnvironmentObject private var statisticsStateController: StatisticsStateController
    
    let webScraper = WebParser()
    
    let hapticsManager = HapticsManager()
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                if state.texts[2].count > 0 {
                    List{
                        ForEach(state.texts[2]) { text in
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
                        state.saveToFile()
                    })
                }
                else {
                    VStack(spacing: 20) {
                        Text("We couldn't find any scanned documents..").bold()
                        Text("Scan some by tapping the ") + Text(Image(systemName: "link.icloud")).bold().foregroundColor(.blue) + Text(" button up top!")
                    }

                }
            }
            .navigationTitle("Import URL")
            .navigationBarItems(trailing: Button(action: {
               self.showPasteUrlView = true
            }, label: {
                Text(Image(systemName: "link.icloud"))
                    .font(.title2)
                    .bold()
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
    
    // Creates new object of type ImportedText, and converts HTML from PasteUrlView to string values
    func createNewTextFromUrlAndAppendToViewTextArray(urlFromPasteView: (String, String)) {
       // Declare object properties
        let textName: String
        // Getting text name from passed tuple
        if urlFromPasteView.0 == "" {
            textName = "Some Text"
        }
        else {
            textName = urlFromPasteView.0
        }
        // Get webscraped text
        let text = webScraper.getParsedTextFromUrl(inputUrl: urlFromPasteView.1)
        // Initialise new imported text object
        let newImportedUrl: ImportedText = ImportedText(texts: text, textName: textName, dateCreated: Date(), textType: "Webpage")
        // Add new object to state array
        self.state.addNewText(newText: newImportedUrl, appendToPosition: 2)
        // Set content last added
        self.statisticsStateController.statistics.contentLastAdded = "Webpage"
    }
    
    func deleteText(at offsets: IndexSet) {
        hapticsManager.createHeavyHaptic()
        self.state.texts[2].remove(atOffsets: offsets)
    }
    
    func createNewUrlAndAddToUniversalArray(newImportedText: ImportedText) {
        let newImportedUrl = ImportedText(texts: newImportedText.texts, textName: newImportedText.textName, dateCreated: Date(), textType: newImportedText.textType)
    }
}

//struct ImportUrlView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImportUrlView()
//    }
//}
