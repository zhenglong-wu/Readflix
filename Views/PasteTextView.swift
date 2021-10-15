//
//  PasteTextView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 08/10/2021.
//

import SwiftUI

struct PasteTextView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var passedData: NewText
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            TextField("Paste text here", text: $textFieldText)
                .textFieldStyle(.roundedBorder)
            Button("Save") {
                passedData.newTexts = textFieldText
                presentationMode.wrappedValue.dismiss()
                
            }
        }
        .navigationTitle("Paste text")
        .padding()
    }
    
}

struct PasteTextView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
