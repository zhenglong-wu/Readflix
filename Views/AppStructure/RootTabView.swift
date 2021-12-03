//
//  RootTabView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct RootTabView: View {
    
    let haptic = UINotificationFeedbackGenerator()
    
    var body: some View {
    
        TabView {
            BookshelfView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Bookshelf")
                }
                .onTapGesture {
                    self.haptic.notificationOccurred(.success)
                }
            StatisticsView()
                .tabItem {
                    Image(systemName: "number")
                    Text("Statistics")
                }
                .onTapGesture {
                    self.haptic.notificationOccurred(.success)
                }
            DiscoverView()
                .tabItem {
                    Image(systemName: "network")
                    Text("Discover")
                }
                .onTapGesture {
                    self.haptic.notificationOccurred(.success)
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
                .onTapGesture {
                    self.haptic.notificationOccurred(.success)
                }
            FlashingReadView()
                .environmentObject(FlashingMethod(importedText: ImportedText(texts: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", textName: "Lorem Ipsum", dateCreated: Date())))
                .tabItem {
                    Image(systemName: "hammer.fill")
                    Text("Read")
                }
                .onTapGesture {
                    self.haptic.notificationOccurred(.success)
                }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
