//
//  DiskCaretaker.swift
//  Rabble Wabble
//
//  Created by Sarvar Boltaboyev on 13/01/25.
//

import Foundation

public final class DiskCaretaker {
    public static let decoder = JSONDecoder()
    public static let encoder = JSONEncoder()
    
    public static func createDocumentURL(withFileName fileName: String) -> URL {
        let fileManager = FileManager.default
        let url = fileManager.urls(for: .documentDirectory,
                                   in: .userDomainMask).first!
        return url.appendingPathComponent(fileName)
            .appendingPathExtension("json")
    }
    
    // 1
    public static func save<T: Codable>(_ object: T, to fileName: String) throws {
        do {
            // 2
            let url = createDocumentURL(withFileName: fileName)
            // 3
            let data = try encoder.encode(object)
            // 4
            try data.write(to: url, options: .atomic)
        } catch (let error) {
            // 5
            print("Save failed: Object: `\(object)`, " +
                  "Error: `\(error)`")
            throw error
        }
    }
    
    // 1
    public static func retrieve<T: Codable>(
        _ type: T.Type, from fileName: String) throws -> T {
            
            let url = createDocumentURL(withFileName: fileName)
            return try retrieve(T.self, from: url)
        }
    
    // 2
    public static func retrieve<T: Codable>(
        _ type: T.Type, from url: URL) throws -> T {
            do {
                // 3
                let data = try Data(contentsOf: url)
                // 4
                return try decoder.decode(T.self, from: data)
            } catch (let error) {
                // 5
                print("Retrieve failed: URL: `\(url)`, Error: `\(error)`")
                throw error
            }
        }
}
