//
//  FileStateController.swift
//  Readflix
//
//  Created by Zhenglong Wu on 30/09/2021.
//

import Foundation

class FileStateController: ObservableObject {
    
    @Published var texts: [Texts] = []
    
    init(){
        loadFromFile()
    }
    
    func getFilePath(fileName: String) -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let userPath = paths[0]
        let url = userPath.appendingPathComponent("\(fileName).json")
        return url
    }
    
    func loadFromFile() {
        
        if let data = try? Data(contentsOf: getFilePath(fileName: "texts")) {
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode([Texts].self, from: data) {
                texts = loaded
            }
        }
    }
    
    func saveToFile() {
        
        // create json encoder
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(texts) {
            // take encoded objects and convert them into string
            if let json = String(data: encoded, encoding: .utf8) {
                // create file path
                let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                let userPath = paths[0]
                let url = userPath.appendingPathComponent("texts.json")
                do{
                    // write the json string to that file
                    try json.write(to: url, atomically: true, encoding: .utf8)
                }
                catch{
                    print(error.localizedDescription)
                }
            }
            else{
                print("unable to form json string")
            }
        }
    }
    
}
