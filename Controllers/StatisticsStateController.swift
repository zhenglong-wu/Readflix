//
//  StatisticsStateController.swift
//  Readflix
//
//  Created by Zhenglong Wu on 08/12/2021.
//

import Foundation

import Foundation

class StatisticsStateController: ObservableObject {

    @Published var statistics: Statistics = Statistics()

    init(){
        loadFromFile()
    }

    func loadFromFile() {

        if let loaded: Statistics = FileManager.default.load(from: "statistics.json") {
            statistics = loaded
        }
    }

    func saveToFile() {
        FileManager.default.save(to: "statistics.json", object: statistics)
    }
}

