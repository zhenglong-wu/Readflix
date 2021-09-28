//
//  ScanView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct ScanView: View {
    
    @State private var showScanner = false
    @State private var text: [ScanDoc] = []
    @State private var isShowingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                if text.count > 0 {
                    List{
                        ForEach(text){text in
                            NavigationLink(
                                destination: ScrollView{Text(text.content)},
                                label: {
                                    Text(getScanName())
                                }
                            )
                        }
                    }
                }
                else {
                    Text("No scannable document identified")
                }
            }
            .navigationTitle("Document Scanner")
            .navigationBarItems(trailing: Button(action: {
                self.showScanner = true
            }, label: {
                Image(systemName: "doc.text.viewfinder")
                    .font(.title)
            })
            .sheet(isPresented: $showScanner, content: {
                makeScanningView()
            })
            )
        }
    }
    
    // This function takes the scanned output from each line of text and appends them to an array
    private func makeScanningView() -> ScanningView {
        ScanningView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanDoc(content: outputText)
                self.text.append(newScanData)
            }
            self.showScanner = false
        })
    }
    
    // Creates alert so that the user can enter a name for the scan
    private func getScanName() -> String {
        
        var scanName: String = ""
        
        let alert = UIAlertController(title: "Scan Name", message: "Enter Scan Name", preferredStyle: .alert)
        alert.addTextField { (scanName) in
            scanName.placeholder = "Name"
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            
        }
        alert.addAction(okAction)
        return scanName
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}

