//
//  FileManager.swift
//  Readflix
//
//  Created by Zhenglong Wu on 30/09/2021.
//

import Foundation

extension FileManager {
    
    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save<T: Codable>(to filePath: String, object: T) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            if let json = String(data: encoded, encoding: .utf8) {
                let url = getDocumentDirectory().appendingPathComponent(filePath)
                do {
                    try json.write(to: url, atomically: true, encoding: .utf8)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func load<T: Codable>(from filePath: String) -> T? {
        let url = getDocumentDirectory().appendingPathComponent(filePath)
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode(T.self, from: data) {
                return loaded
            }
            else {
                print("Failed to decode")
                return nil
            }
        }
        else {
            print("Could not find file at given path")
            return nil
        }
    }
}
