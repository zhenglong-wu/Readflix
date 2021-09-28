//
//  BookshelfView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct BookshelfView: View {
    var body: some View {
        
        NavigationView {
            NavigationLink(
                destination: ImportView(),
                label: {
                    Text("Import")
                }
            )
                .navigationTitle("My Bookshelf")
        }
    }
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
    }
}
