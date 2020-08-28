/*
 *	LifeExpectencyRepository.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import Foundation

class LifeExpectencyRepository {
    
    // MARK: - Properties
    private let request = LifeExpectencyRequest()
    
    // MARK: - Exposed Methods
    func refresh(completion: @escaping (Result<[LifeExpectency], NetworkError>) -> Void) {
        request.load(with: completion)
    }
}
