//
//  RootTabView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct RootTabView: View {
    
    var body: some View {
    
        TabView {
            BookshelfView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Bookshelf")
                }
            StatisticsView()
                .tabItem {
                    Image(systemName: "number")
                    Text("Statistics")
                }
            DiscoverView()
                .tabItem {
                    Image(systemName: "network")
                    Text("Discover")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
            FlashingReadView()
                .environmentObject(FlashingMethod(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date())))
                .tabItem {
                    Image(systemName: "hammer.fill")
                    Text("Read")
                }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
