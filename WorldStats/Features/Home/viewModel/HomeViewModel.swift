/*
 *	HomeViewModel.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit

class HomeViewModel {
    
    // MARK: - Properties
    var recordsCount: Int {
        records.count
    }
    
    private let repository: LifeExpectencyRepository
    private var records: [LifeExpectency] = []
    
    // MARK: - Constructors
    init(repository: LifeExpectencyRepository) {
        self.repository = repository
    }
    
    // MARK: - Exposed Methods
    func item(at index: Int) -> LifeExpectency? {
        guard index < records.count else { return nil }
        return records[index]
    }
    
    func reload(completion: @escaping ()->Void ) {
        repository.refresh { [weak self] result in
            defer { completion() }
            if case .success(let records) = result {
                self?.records = records.sortedByCountryName
            }
        }
    }
}

// MARK: - Exposed Methods
extension Array where Element == LifeExpectency {
    var sortedByCountryName: [Element] {
        return self.sorted { $1.country > $0.country }
    }
}
