//
//  DiscoverView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ScanView(),
                label: {
                    Text("Import")
                }
            )
                .navigationTitle("My Bookshelf")
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
