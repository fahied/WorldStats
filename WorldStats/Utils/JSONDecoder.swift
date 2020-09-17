/*
 *	JSONDecoder.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit


// MARK: - JSONDecoder helper
extension JSONDecoder {
    /// Decode
    func decode<T: Decodable>(_ type: T.Type, from data: Data, keyPath: String) throws -> T {
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        if let nestedItems = (jsonObject as AnyObject).value(forKeyPath: keyPath) {
            let nestedItems = try JSONSerialization.data(withJSONObject: nestedItems)
            return try decode(type, from: nestedItems)
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Nested json not found for key path \"\(keyPath)\""))
        }
    }
}
