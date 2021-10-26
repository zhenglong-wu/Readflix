//
//  AlertTestView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 06/10/2021.
//

import SwiftUI

struct AlertTestView: View {
    
    @State var scanName: String = ""
    
    var body: some View {
        Text(displayDocumentAlert())
    }
    
    func displayDocumentAlert() -> String {
        
        @State var text: String = ""
        
        let alert = UIAlertController(title: "Document Name", message: "Please enter a name for the scan", preferredStyle: .alert)
        alert.addTextField { (text) in
            text.placeholder = "Name"
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            text = alert.textFields![0].text!
            print(text)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            text = "Document"
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)  {
            text = alert.textFields![0].text!
            print("completion activated")
        }
        return text
    }
}

struct AlertTestView_Previews: PreviewProvider {
    static var previews: some View {
        AlertTestView()
    }
}
