//
//  BookshelfItem.swift
//  Readflix
//
//  Created by Zhenglong Wu on 04/12/2021.
//

import SwiftUI

struct BookshelfItem: View {
    
    @State var importedText: ImportedText
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(importedText.textName)
                        .bold()
                        .font(.body)
                        .foregroundColor(.blue)
                    Spacer()
                }
                HStack {
                    Text("\(String(importedText.texts.prefix(75)))...")
                        .font(.system(size: CGFloat(10)))
                        .padding(.all, 3)
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Text(importedText.textType)
                        .italic()
                        .font(.system(size: CGFloat(13)))
                    Spacer()
                }
            }
            .padding(4)
            .padding(.horizontal)
        }

    }
}

struct BookshelfItem_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfItem(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date(), textType: "Raw text"))
    }
}
