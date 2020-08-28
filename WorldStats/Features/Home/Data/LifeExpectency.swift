/*
 *	LifeExpectency.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import Foundation

struct LifeExpectency: Codable {
    
    // MARK: - Properties
    let number: Int
    let country: String
    let both: Double
    let males: Double
    let females: Double
    
}
