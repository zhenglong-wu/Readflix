//
//  PasteTextView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 08/10/2021.
//

import SwiftUI

struct PasteTextView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    @State private var text: [ImportedText] = []
    
    var body: some View {
        VStack {
            TextField("Paste text here", text: $textFieldText)
                .textFieldStyle(.roundedBorder)
            Button("Save") {
                text.append(ImportedText(texts: textFieldText, dateCreated: Date()))
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Paste text")
        .padding()
    }
}

struct PasteTextView_Previews: PreviewProvider {
    static var previews: some View {
        PasteTextView()
    }
}
