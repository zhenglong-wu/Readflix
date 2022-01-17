//
//  RootTabView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct RootTabView: View {
    
    @EnvironmentObject var statisticsStateController: StatisticsStateController

    var body: some View {
    
        TabView {
            BookshelfView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Bookshelf")
                }
                .environmentObject(statisticsStateController)

            StatisticsView()
                .tabItem {
                    Image(systemName: "number")
                    Text("Statistics")
                }
                .environmentObject(statisticsStateController)

            DiscoverView()
                .tabItem {
                    Image(systemName: "network")
                    Text("Discover")
                }
//            ProfileView()
//                .tabItem {
//                    Image(systemName: "person.crop.circle.fill")
//                    Text("Profile")
//                }

        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
