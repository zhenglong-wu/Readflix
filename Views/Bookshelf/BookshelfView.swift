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
    
    @State private var showingSheet = false

    var body: some View {
        
        NavigationView {
            VStack {
                if state.texts[4].count == 0 {
                    Text("No texts to show here...")
                }
                else {
                    List {
                        ForEach(state.texts[4]) { (text) in
                            let flashingMethod = FlashingMethod(importedText: text)
                            NavigationLink(destination: {
                                FlashingReadView(flashingMethod: flashingMethod)
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
        let flashingReadView = FlashingReadView(flashingMethod: flashingMethod)
        return flashingReadView
    }
    
    func deleteText(at offsets: IndexSet) {
        self.state.texts[4].remove(atOffsets: offsets)
    }
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
            .environmentObject(ImportedTextFileStateController())
    }
}

