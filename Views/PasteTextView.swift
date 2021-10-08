//
//  PasteTextView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 08/10/2021.
//

import SwiftUI

struct PasteTextView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            Text("Coming soon...")
            TextField("Paste text here", text: $textFieldText)
        }
        .navigationTitle("Paste text")
    }
}

struct PasteTextView_Previews: PreviewProvider {
    static var previews: some View {
        PasteTextView()
    }
}
