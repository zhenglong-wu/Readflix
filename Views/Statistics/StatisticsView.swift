//
//  StatisticsView.swift
//  Readflix
//
//  Created by Zhenglong Wu on 28/09/2021.
//

import SwiftUI

struct StatisticsView: View {
    
    @EnvironmentObject var statisticsStateController: StatisticsStateController
    @EnvironmentObject private var state: ImportedTextFileStateController
    
    @State private var viewOption = "Reading"
    
    var options = ["Reading", "Importing"]
    
    let hapticsManager = HapticsManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $viewOption, content: {
                    ForEach(options, id: \.self) {
                        Text($0)
                    }
                })
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: viewOption) { _ in
                        hapticsManager.createLightHaptic()
                    }

                if viewOption == "Reading" {
                    ReadingStatisticsView()
                }
                else {
                    ImportStatisticsView(values: [Double(state.texts[0].count), Double(state.texts[1].count), Double(state.texts[2].count), Double(state.texts[3].count)], names: ["Scans", "Raw texts", "Webpages", "PDFs"], formatter: {value in String(format: "%.0f", value)})
                        .padding()
                }
                Spacer()
            }
            .navigationTitle("Statistics")
            
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
            .environmentObject(ImportedTextFileStateController())
            .environmentObject(StatisticsStateController())
    }
}
