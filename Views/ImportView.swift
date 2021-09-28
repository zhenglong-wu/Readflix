//
//  ImportView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct ImportView: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ScanView(),
                label: {
                    Text("Scan Documents")
                }
            )
                .navigationTitle("My Bookshelf")
        }
    }
}

struct ImportView_Previews: PreviewProvider {
    static var previews: some View {
        ImportView()
    }
}
