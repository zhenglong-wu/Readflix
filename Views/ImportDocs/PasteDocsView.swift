//
//  PasteDocsView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 11/11/2021.
//

import SwiftUI
import UniformTypeIdentifiers
import PDFKit

struct PasteDocsView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var statisticsStateController: StatisticsStateController
    
    @State private var pdfScraper: PdfScraper = PdfScraper(input: "")
    @State var titleTextFieldText: String = ""
    @State var showInputPdfView: Bool = true
    @State var isShowingEmptyPdfErrorAlert: Bool = false
    @State var output: (title: String, text: String) = ("", "")
    var save: ((String, String)) -> Void
    
    let hapticsManager = HapticsManager()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Text(pdfScraper.input)
                        .padding()
                }
            }
            .fileImporter(isPresented: $showInputPdfView, allowedContentTypes: [.pdf], allowsMultipleSelection: false) { result in
                do {
                    guard let selectedFile: URL = try result.get().first else { return }
                    if selectedFile.startAccessingSecurityScopedResource() {
                        
                        if let pdf = PDFDocument(url: selectedFile) {
                            let pageCount = pdf.pageCount
                            let content = NSMutableAttributedString()
                            
                            for i in 0..<pageCount {
                                guard let page = pdf.page(at: i) else { continue }
                                guard let pageContent = page.attributedString else { continue }
                                content.append(pageContent)
                            }
                            pdfScraper.input = content.string
                        }
                    }
                    else {
                        print("Unable to access files, you have not permitted access.")
                    }
                }
                catch {
                    print("Unable to read content of file.")
                    print(error.localizedDescription)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading, content: {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                })
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading, content: {
                    TextField("Enter title here", text: $titleTextFieldText)
                })
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing, content: {
                    Button {
                        if self.titleTextFieldText == "" || self.pdfScraper.input == "" {
                            isShowingEmptyPdfErrorAlert = true
                        }
                        else {
                            hapticsManager.createSuccessHaptic()
                            self.statisticsStateController.saveToFile()
                            saveText()
                        }
                        
                    } label: {
                        Text("Save")
                    }
                    .alert(isPresented: $isShowingEmptyPdfErrorAlert) {
                        Alert(
                            title: Text("Continue?"),
                            message: Text("The PDF and/or the text name is empty, would you like to continue?"),
                            primaryButton: .cancel(Text("Cancel"), action: {
                                
                            }),
                            secondaryButton: .destructive(Text("Yes"), action: {
                                saveText()
                            })
                        )
                    }
                })
            }
        }
    }
    
    func saveText() {
        output = (titleTextFieldText, pdfScraper.input)
        save(output)
        presentationMode.wrappedValue.dismiss()
    }
}

struct PasteDocsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("No previews Available...")
    }
}
