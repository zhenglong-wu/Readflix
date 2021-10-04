//
//  ImportView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct ImportView: View {
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 75) {
                HStack(spacing: 50) {
                    NavigationLink(destination: ImportScanView(), label: {ImportButtonItemView(iconSymbolName: "doc.text.viewfinder", iconDescription: "Scan")})
                    NavigationLink(destination: PasteTextView(), label: {ImportButtonItemView(iconSymbolName: "doc.text", iconDescription: "Text")})
                    NavigationLink(destination: ImportDocsView(), label: {ImportButtonItemView(iconSymbolName: "doc.plaintext", iconDescription: "Docs")})
                }
                HStack(spacing: 50) {
                    NavigationLink(destination: ImportUrlView(), label: {ImportButtonItemView(iconSymbolName: "network", iconDescription: "Web")})
                    NavigationLink(destination: ImportNewsView(), label: {ImportButtonItemView(iconSymbolName: "newspaper", iconDescription: "News")})
                    NavigationLink(destination: ImportBooksView(), label: {ImportButtonItemView(iconSymbolName: "book", iconDescription: "Books")})
                }
            }
            .navigationTitle("Import")
        }
    }
}

struct ImportView_Previews: PreviewProvider {
    static var previews: some View {
        ImportView()
    }
}


