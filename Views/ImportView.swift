//
//  ImportView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct ImportView: View {
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ScanView(),
                label: {
                    Text("Import")
                }
            )
        }
    }
}

struct ImportView_Previews: PreviewProvider {
    static var previews: some View {
        ImportView()
    }
}
