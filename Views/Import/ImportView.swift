//
//  ImportView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct ImportView: View {
    
    @EnvironmentObject private var state: ImportedTextFileStateController
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing, spacing: 30) {
                VStack {
                    HStack {
                        Text("Add local sources")
                            .bold()
                            .font(.title3)
                            .padding(.horizontal)
                            .padding(.bottom)
                        Spacer()
                    }
                    HStack(spacing: 40) {
                        NavigationLink(destination: ImportScanView(), label: {ImportButtonItemView(iconSymbolName: "doc.text.viewfinder", iconDescription: "Scan")})
                        NavigationLink(destination: ImportTextView(), label: {ImportButtonItemView(iconSymbolName: "text.alignleft", iconDescription: "Text")})
                        NavigationLink(destination: ImportDocsView(), label: {ImportButtonItemView(iconSymbolName: "doc.plaintext", iconDescription: "Docs")})
                    }
                }
                VStack {
                    HStack {
                        Text("Add online sources")
                            .bold()
                            .font(.title3)
                            .padding(.horizontal)
                            .padding(.bottom)
                        Spacer()
                    }
                    HStack(spacing: 40) {
                        NavigationLink(destination: ImportUrlView(), label: {ImportButtonItemView(iconSymbolName: "network", iconDescription: "Web")})
                        NavigationLink(destination: ImportNewsView(), label: {ImportButtonItemView(iconSymbolName: "newspaper", iconDescription: "News")})
                        NavigationLink(destination: ImportBooksView(), label: {ImportButtonItemView(iconSymbolName: "text.book.closed", iconDescription: "eBooks")})
                    }
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


