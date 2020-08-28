/*
 *	LifeExpectencyRequest.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit

class LifeExpectencyRequest: NetworkRequest {
    
    typealias Model = [LifeExpectency]

    let url = URL(string: "https://api.jsonbin.io/b/5f480b5d993a2e110d37b668")!
    let jsonKeyPath = "items"

    func decode(_ data: Data) -> Model? {
        do {
            return try JSONDecoder().decode(Model.self, from: data, keyPath: jsonKeyPath)
        } catch (let error) {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    func load(with completion: @escaping (Result<Model, NetworkError>) -> Void) {
        load(with: url, completion: completion)
    }
}
