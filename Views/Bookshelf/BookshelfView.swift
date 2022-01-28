//
//  BookshelfView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI
import QuickLook
import Foundation

struct BookshelfView: View {
    
    @EnvironmentObject private var state: ImportedTextFileStateController
    @EnvironmentObject var statisticsStateController: StatisticsStateController
    
    @State private var showingSheet = false
    
    let hapticsManager = HapticsManager()

    var body: some View {
        
        NavigationView {
            VStack {
                if state.texts[4].count == 0 {
                    VStack(spacing: 20) {
                        Text("Uh oh").foregroundColor(.red).bold() + Text(", there aren't any reads here!").bold()
                            .bold()
                        Text("Import some by taping the ") + Text(Image(systemName: "plus")).foregroundColor(.blue).bold() + Text(" button up top!")
                    }
                    .padding()
                }
                else {
                    List {
                        ForEach(state.texts[4]) { (text) in
                            let flashingMethod = FlashingMethod(importedText: text)
                            NavigationLink(destination: {
                                FlashingReadView()
                                    .environmentObject(flashingMethod)
                                    .environmentObject(statisticsStateController)
                            }, label: {
                                BookshelfItem(importedText: text)
                            })
                        }
                        .onDelete(perform: deleteText)
                    }
                }
            }
            .navigationTitle("Bookshelf")
            .navigationBarItems(trailing: Button(action: {
                self.showingSheet = true
            }, label: {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingSheet, content: {
                ImportView()
            }))

        }
        
    }
    
    func createFlashingReadView(flashingMethod: FlashingMethod) -> FlashingReadView {
        let flashingReadView = FlashingReadView()
        return flashingReadView
    }
    
    func deleteText(at offsets: IndexSet) {
        hapticsManager.createHeavyHaptic()
        self.state.texts[4].remove(atOffsets: offsets)
    }
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
            .environmentObject(ImportedTextFileStateController())
    }
}

