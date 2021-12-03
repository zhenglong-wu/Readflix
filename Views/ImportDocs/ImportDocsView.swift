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

    @State var showInputPdfView: Bool = false
    @State var isShowingEmptyPdfErrorAlert: Bool = false
    
    
    var body: some View {
        VStack {
            if state.texts[3].count > 0 {
                List{
                    ForEach(state.texts[3]) { text in
                        NavigationLink(
                            destination: ScrollView{
                                Text(text.texts)
                                    .padding()
                            },
                            label: {
                                Text(text.textName)
                                    .padding()
                            }
                        )
                    }
                    .onDelete(perform: deleteText)
                }
                .onAppear(perform: { state.saveToFile()})
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
//        .fileImporter(isPresented: $showInputPdfView, allowedContentTypes: [.pdf], allowsMultipleSelection: false) { result in
//            do {
//                guard let selectedFile: URL = try result.get().first else { return }
//                if selectedFile.startAccessingSecurityScopedResource() {
//
//                    if let pdf = PDFDocument(url: selectedFile) {
//                        let pageCount = pdf.pageCount
//                        let content = NSMutableAttributedString()
//
//                        for i in 0..<pageCount {
//                            guard let page = pdf.page(at: i) else { continue }
//                            guard let pageContent = page.attributedString else { continue }
//                            content.append(pageContent)
//                        }
//                        inputPdf.input = content.string
//                        if inputPdf.input == "" {
//                            isShowingEmptyPdfErrorAlert = true
//                        }
//                        else {
//                            print("TODO")
//                        }
//                    }
//                }
//                else {
//                    print("Unable to access files, you have not permitted access.")
//                }
//            }
//            catch {
//                print("Unable to read content of file.")
//                print(error.localizedDescription)
//            }
//        }
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
         
        let newImportedText: ImportedText = ImportedText(texts: textFromPDF.1, textName: textName, dateCreated: Date())
        self.state.addNewText(newText: newImportedText, appendToPosition: 3)
    }
    
    func deleteText(at offsets: IndexSet) {
        self.state.texts[3].remove(atOffsets: offsets)
    }
}

struct ImportDocsView_Previews: PreviewProvider {
    static var previews: some View {
        ImportDocsView()
    }
}
