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
    @State var textName: String = ""
    @State var output: (title: String, text: String) = ("", "")
    var save: ((String, String)) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    TextEditor(text: $textFieldText)
                }
                .overlay(
                         RoundedRectangle(cornerRadius: 10)
                           .stroke(Color.gray, lineWidth: 1)
                         )
                .padding(10)
                Button(action: {
                    output = (textName, textFieldText)
                    save(output)
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                        .bold()
                })
            }
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading, content: {
                    TextField("Enter title", text: $textName)
                })
            }
            .padding()
        }
    }
}

struct PasteTextView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


