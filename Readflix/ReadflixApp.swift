//
//  ReadflixApp.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

@main
struct ReadflixApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootTabView()
        }
    }
}
    
//    let persistenceController = PersistenceController.shared
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
//    }

