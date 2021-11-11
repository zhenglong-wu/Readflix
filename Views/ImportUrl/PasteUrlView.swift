//
//  PasteUrlView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 04/11/2021.
//

import SwiftUI

struct PasteUrlView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    @State var textName: String = ""
    @State var output: (title: String, text: String) = ("", "")
    @State var isShowingEmptyUrlTextFieldErrorAlert = false
    var save: ((String, String)) -> Void
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField("Enter URL here", text: $textFieldText)
                    .padding()
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading, content: {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                })
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing, content: {
                    Button {
                        if self.textFieldText == "" || self.textName == "" {
                            isShowingEmptyUrlTextFieldErrorAlert = true
                        }
                        else {
                            saveText()
                        }
                    } label: {
                        Text("Save")
                            .bold()
                    }
                    .alert(isPresented: $isShowingEmptyUrlTextFieldErrorAlert) {
                        Alert(
                            title: Text("Error!"),
                            message: Text("The textfield and/or the text name is empty, please enter values."),
                            dismissButton: .default(Text("OK"), action: {
                                
                            })
                        )
                    }
                })
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigation, content: {
                    TextField("Enter title here", text: $textName)
                })
            }
        }
        
    }
    
    func saveText() {
        output = (textName, textFieldText)
        save(output)
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct PasteUrlView_Previews: PreviewProvider {
    static var previews: some View {
        Text("No preview available")
    }
}
