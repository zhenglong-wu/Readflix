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
    @EnvironmentObject private var statisticsStateController: StatisticsStateController
    
    let hapticsManager = HapticsManager()
    
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
                    .onAppear(perform: {
                        state.saveToFile()
                        //statisticsStateController.saveToFile()
                    })
                }
                else {
                    VStack(spacing: 20) {
                        Text("We couldn't find any scanned documents..").bold()
                        Text("Scan some by tapping the ") + Text(Image(systemName: "doc.text.viewfinder")).bold().foregroundColor(.blue) + Text(" button up top!")
                    }
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
                Text(Image(systemName: "doc.text.viewfinder"))
                    .font(.title2)
                    .bold()
            })
            .sheet(isPresented: $showScanner, content: {
                createScanningView()
            }))
            
    }
    
    // This function takes the scanned output from each line of text and appends them to the property texts in class ImportedText
    private func createScanningView() -> ScanningView {
        ScanningView(completion: {
            textPerPage in
            // Join optional lines of text separated by space
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                if outputText.count == 0 {
                    self.isShowingScanningErrorAlert = true
                }
                else {
                    // Create new imported text
                    let newScanData = ImportedText(texts: outputText, textName: "Some Text", dateCreated: Date(), textType: "Scan")
                    // Add new imported text to state controller
                    self.state.addNewText(newText: newScanData, appendToPosition: 0)
                    // Change last added state
                    self.statisticsStateController.statistics.contentLastAdded = "Scan"
                    // Save to local JSON location
                    self.statisticsStateController.saveToFile()
                }
            }
            // Create haptic to note end of task
            hapticsManager.createSuccessHaptic()
            // Remove scanner sheet from view
            self.showScanner = false
        })
    }
    
    // Deletes text from the stateController array at index position
    func deleteText(at offsets: IndexSet) {
        hapticsManager.createHeavyHaptic()
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
    
}

