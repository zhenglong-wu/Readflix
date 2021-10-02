//
//  ImportButtonItemView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 01/10/2021.
//

import SwiftUI

struct ImportButtonItemView: View {
    
    let iconSymbolName: String
    let iconDescription: String
    
    var body: some View {
        VStack {
            Image(systemName: "\(iconSymbolName)")
                .font(Font.title.weight(.bold))
                .foregroundColor(.blue)
                .padding(3)
            Text("\(iconDescription)")
                .bold()
        }
        .frame(minWidth: 55)
        .foregroundColor(.blue)
        .padding(15)
        .background(.ultraThickMaterial)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ImportButtonItemView_Previews: PreviewProvider {
    static var previews: some View {
        ImportButtonItemView(iconSymbolName: "viewfinder", iconDescription: "Scan")
    }
}

