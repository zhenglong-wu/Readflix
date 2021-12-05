//
//  ImportScanView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct ImportScanView: View {
    
    @State private var showScanner = false
    @State private var isShowingAlert = false
    @State var isShowingScanningErrorAlert = false
    
    @EnvironmentObject var state: ImportedTextFileStateController
    
    var body: some View {
      
            VStack {
                if state.texts[0].count > 0 {
                    List{
                        ForEach(state.texts[0], id: \.id) { text in
                            NavigationLink(
                                destination: BrowseImportedTextView(importedText: text),
                                label: {
                                    Text(text.textName)
                                }
                            )
                                //.onAppear(perform: displayDocumentAlert())
                        }
                        .onDelete(perform: deleteText)
                    }
                    .onAppear(perform: { state.saveToFile()})
                }
                else {
                    Text("No scanned documents...")
                    Text("\n")
                    Text("You can import your own text by tapping the top right button!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
            }
            .alert(isPresented: $isShowingScanningErrorAlert) {
                Alert(
                    title: Text("Error!"),
                    message: Text("The camera could not find any text, please try again."),
                    dismissButton: .default(Text("OK"), action: {
                        self.showScanner = false
                    })
                )
            }
            .navigationTitle("Scan Documents")
            .navigationBarItems(trailing: Button(action: {
               self.showScanner = true
            }, label: {
                Image(systemName: "doc.text.viewfinder")
                    .font(.title2)
            })
            .sheet(isPresented: $showScanner, content: {
                createScanningView()
            }))
            
    }
    
    // This function takes the scanned output from each line of text and appends them to the property texts in class ImportedText
    private func createScanningView() -> ScanningView {
        ScanningView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                if outputText.count == 0 {
                    self.isShowingScanningErrorAlert = true
                }
                else {
                    let newScanData = ImportedText(texts: outputText, textName: "Some Text", dateCreated: Date(), textType: "Scan")
                    self.state.addNewText(newText: newScanData, appendToPosition: 0)
                    self.state.addNewTextToUniversalIndex(newText: newScanData)
                }
            }
            self.showScanner = false
        })
    }
    
    func deleteText(at offsets: IndexSet) {
        let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
        hapticFeedback.impactOccurred()
        self.state.texts[0].remove(atOffsets: offsets)
    }
    
    //Creates alert so that the user can enter a name for the scan
    func displayDocumentAlert(text: ImportedText) {

//        let alert = UIAlertController(title: "Document Name", message: "Please enter a name for the scan", preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
//            text.textName = alert.textFields![0].text!
//            print(text.textName)
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
//            text.textName = "Document Scan"
//        }
//        alert.addAction(cancelAction)
//        alert.addAction(okAction)
//
//        // Need to change this code!!
//        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)  {
//            text.textName = alert.textFields![0].text!
//            print("completion activated")
//        }
    }
    
    func displayDocumentAlert() {
        
        let alert = UIAlertController(title: "Scan Name", message: "Please enter a name for your scan", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
 
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true) {
            
        }
    }
}

