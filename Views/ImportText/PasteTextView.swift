//
//  PasteTextView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 08/10/2021.
//

import SwiftUI

struct PasteTextView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var statisticsStateController: StatisticsStateController
    
    @State var textFieldText: String = ""
    @State var textName: String = ""
    @State var output: (title: String, text: String) = ("", "")
    @State var isShowingEmptyTextFieldErrorAlert = false
    var save: ((String, String)) -> Void
    
    let hapticsManager = HapticsManager()
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Enter title", text: $textName)
                    .padding()
                
                ZStack {
                    TextEditor(text: $textFieldText)
                        .padding()
                }
                .overlay(
                         RoundedRectangle(cornerRadius: 10)
                           .stroke(Color.gray, lineWidth: 1)
                         )
                .padding(10)
                Button(action: {
                    let pasteBoard = UIPasteboard.general
                    self.textFieldText = pasteBoard.string ?? ""
                }, label: {
                    ZStack {
                        Text("Paste")
                            .bold()
                            .foregroundColor(.white)
                            .padding(12)
                    }
                    .background(.blue)
                    .cornerRadius(22)
                })
                
            }
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
                        if self.textFieldText == "" || self.textName ==  "" {
                            hapticsManager.creatErrorHaptic()
                            isShowingEmptyTextFieldErrorAlert = true
                        }
                        else {
                            hapticsManager.createSuccessHaptic()
                            self.statisticsStateController.saveToFile()
                            saveText()
                        }
                    } label: {
                        Text("Save")
                            .bold()
                    }
                    .alert(isPresented: $isShowingEmptyTextFieldErrorAlert) {
                        Alert(
                            title: Text("Continue?"),
                            message: Text("The textfield and/or the text name is empty, would you like to continue?"),
                            primaryButton: .cancel(Text("Cancel"), action: {
                                
                            }),
                            secondaryButton: .destructive(Text("Yes"), action: {
                                hapticsManager.createWarningHaptic()
                                saveText()
                            })
                        )
                    }
                })
            }
            .padding()
        }
    }
    
    func saveText() {
        output = (textName, textFieldText)
        save(output)
        presentationMode.wrappedValue.dismiss()
    }
    
    func displayAlertIfTextFieldIsEmpty() {
        let alert = UIAlertController(title: "Are you sure you want to continue?", message: "The textfield is empty, please input text.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {_ in
            output = (textName, textFieldText)
            save(output)
            presentationMode.wrappedValue.dismiss()
        }))

        alert.present(alert, animated: true)
    }
}

struct PasteTextView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


