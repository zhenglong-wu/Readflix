//
//  ImportScanView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct ImportScanView: View {
    
    @State private var showScanner = false
    @State private var text: [ImportedText] = []
    @State private var isShowingAlert = false
    @EnvironmentObject var documentState: FileStateController
    
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
                                .onAppear(perform: displayDocumentAlert())
                        }
                    }
                    //.onAppear(perform: { documentState.saveToFile()})
                }
                else {
                    Text("No scannable document identified")
                }
            }
            .navigationTitle("Scan Documents")
            .navigationBarItems(trailing: Button(action: {
               self.showScanner = true
            }, label: {
                Image(systemName: "doc.text.viewfinder")
                    .font(.title)
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
                let newScanData = ImportedText(texts: outputText, dateCreated: Date())
                self.text.append(newScanData)
            }
            self.showScanner = false
        })
    }
    
    // Creates alert so that the user can enter a name for the scan
//    func displayDocumentAlert(text: ImportedText) {
//
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
//    }
    
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

