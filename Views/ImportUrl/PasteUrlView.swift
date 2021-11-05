//
//  PasteUrlView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 04/11/2021.
//

import SwiftUI

struct PasteUrlView: View {
    
    var webScraper = WebScraper()
    
    var body: some View {
        
        VStack {
            
        }
        .onAppear(perform: {
            webScraper.getParsedText(inputUrl: "https://www.apple.com/uk/macbook-pro-14-and-16/")
        })
        
    }
    
}

struct PasteUrlView_Previews: PreviewProvider {
    static var previews: some View {
        PasteUrlView()
    }
}
