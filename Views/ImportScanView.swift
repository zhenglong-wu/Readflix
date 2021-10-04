//
//  ScanView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct ImportScanView: View {
    
    @State private var showScanner = false
    @State private var text: [Texts] = []
    @State private var isShowingAlert = false
    @EnvironmentObject var documentState: FileStateController
    
    var body: some View {
      
            VStack {
                if text.count > 0 {
                    List{
                        ForEach(text) {text in
                            NavigationLink(
                                destination: ScrollView{Text(text.content)},
                                label: {
                                    Text(displayDocumentAlert())
                                }
                            )
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
    
    // This function takes the scanned output from each line of text and appends them to an array
    private func createScanningView() -> ScanningView {
        ScanningView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = Texts(content: outputText)
                self.text.append(newScanData)
            }
            self.showScanner = false
        })
    }
    
    // Creates alert so that the user can enter a name for the scan
    func displayDocumentAlert() -> String {
        
        var documentName: String = ""
        
        let alert = UIAlertController(title: "Document Name", message: "Please enter a name for the scan", preferredStyle: .alert)
        alert.addTextField { (documentName) in
            documentName.placeholder = "Name"
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            documentName = alert.textFields![0].text!
            print(documentName)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            documentName = "Document"
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)  {
            documentName = alert.textFields![0].text!
            print("completion activated")
        }
        return documentName
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ImportScanView()
            .environmentObject(FileStateController())
    }
}

