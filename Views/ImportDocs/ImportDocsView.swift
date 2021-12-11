//
//  ImportDocsView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 02/10/2021.
//

import SwiftUI
import UniformTypeIdentifiers
import PDFKit

struct ImportDocsView: View {
    
    @EnvironmentObject private var state: ImportedTextFileStateController
    @EnvironmentObject private var statisticsStateController: StatisticsStateController

    @State var showInputPdfView: Bool = false
    @State var isShowingEmptyPdfErrorAlert: Bool = false
    
    let hapticsManager = HapticsManager()
    
    var body: some View {
        VStack {
            if state.texts[3].count > 0 {
                List{
                    ForEach(state.texts[3]) { text in
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
                    //statisticsStateController.saveToFile()
                })
            }
            else {
                Text("No imported PDFs...")
                Text("\n")
                Text("You can import PDF by tapping the top right button!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Import Documents")
        .navigationBarItems(trailing: Button(action: {
           self.showInputPdfView = true
        }, label: {
            Image(systemName: "doc")
                .font(.title2)
        }))
        .sheet(isPresented: $showInputPdfView, content: {
            createPasteDocsView()
        })
        .alert(isPresented: $isShowingEmptyPdfErrorAlert) {
            Alert(
                title: Text("Error!"),
                message: Text("The textfield and/or the text name is empty, please enter values."),
                dismissButton: .default(Text("OK"), action: {
                    
                })
            )
        }
    }
    
    func createPasteDocsView() -> PasteDocsView {
        
        var newText: (String, String) = ("", "")
        let newPasteDocsView = PasteDocsView(save: { (pastedDocs: (String, String)) in
            newText = pastedDocs
            createNewTextAddToStateArray(textFromPDF: newText)
        })
        self.showInputPdfView = false
        return newPasteDocsView
    }
    
    func createNewTextAddToStateArray(textFromPDF: (String, String)) {
        
        let textName: String
        
        if textFromPDF.0 == "" {
            textName = "Some Text"
        }
        else {
            textName = textFromPDF.0
        }
         
        let newImportedPdf: ImportedText = ImportedText(texts: textFromPDF.1, textName: textName, dateCreated: Date(), textType: "PDF")
        self.state.addNewText(newText: newImportedPdf, appendToPosition: 3)
        self.statisticsStateController.statistics.contentLastAdded = "PDF"
    }
    
    func deleteText(at offsets: IndexSet) {
        hapticsManager.createHeavyHaptic()
        self.state.texts[3].remove(atOffsets: offsets)
    }
}

struct ImportDocsView_Previews: PreviewProvider {
    static var previews: some View {
        ImportDocsView()
    }
}
