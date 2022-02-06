//
//  ReadflixApp.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

@main
struct ReadflixApp: App {
    
    @State var importedTextFileStateController = ImportedTextFileStateController()
    @State var statisticsStateController = StatisticsStateController()
    
    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(importedTextFileStateController)
                .environmentObject(statisticsStateController)
        }
    }
}
    


