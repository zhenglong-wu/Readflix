//
//  FileManager.swift
//  Readflix
//
//  Created by Zhenglong Wu on 30/09/2021.
//

import Foundation

extension FileManager {
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Saves JSON encoded object to local file document directory
    func save<T: Codable>(to filePath: String, object: T) {
        
        // Unwrap optional
        if let json = encodeToJson(object: object) {
            // Get document directory URL
            let url  = getDocumentDirectory().appendingPathComponent(filePath)
            do {
                // Try writing object to document directory
                try json.write(to: url, atomically: true, encoding: .utf8)
            }
            catch {
                // Output error if failure
                print(error.localizedDescription)
            }
        }
    }
    
    func encodeToJson<T: Codable>(object: T) -> String? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            if let json = String(data: encoded, encoding: .utf8) {
                return json
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    // Loads JSON encoded object from local file document directory
    func load<T: Codable>(from filePath: String) -> T? {
        
        // Get document directory URL
        let url = getDocumentDirectory().appendingPathComponent(filePath)
        // Unwrap optional
        if let data = try? Data(contentsOf: url) {
            // Return decoded data
            return decodeFromJson(data: data)
        }
        else {
            // Handles failure and outputs error
            print("Could not find file at given path")
            return nil
        }
        
    }
    
    func decodeFromJson<T: Codable>(data: Data) -> T? {
        let decoder = JSONDecoder()
        if let loaded = try? decoder.decode(T.self, from: data) {
            return loaded
        }
        else {
            print("Failed to decode")
            return nil
        }
    }
    
}
