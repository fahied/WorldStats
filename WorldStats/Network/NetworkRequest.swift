/*
 *	NetworkRequest.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import Foundation


// MARK: - Type -
enum NetworkError: Error {
    case requestFailed
    case emptyResponse
    case decodingFailed
}

protocol NetworkRequest: AnyObject {
    associatedtype Model
    func decode(_ data: Data) -> Model?
    func load(with completion: @escaping (Result<Model, NetworkError>) -> Void)
    func load(with url: URL, completion: @escaping (Result<Model, NetworkError>) -> Void)
}

extension NetworkRequest {
    
    func load(with url: URL, completion: @escaping (Result<Model, NetworkError>) -> Void) {
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            if error !=  nil {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.emptyResponse))
                return
            }
            
            guard let result = self?.decode(data) else {
                completion(.failure(.decodingFailed))
                return
            }
            
            completion(.success(result))
        })
        task.resume()
    }
}
