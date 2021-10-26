//
//  BookshelfView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct BookshelfView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Coming soon...")
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
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
    }
}

