/*
 *	BarChartViewModel.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit
import Charts

struct BarChartViewModel {
    
    // MARK: - Properties
    let entries: [BarChartDataEntry]
    let chartlabel: String
    let chartDescription: String
    
    var data: BarChartData {
        let dataSet  = BarChartDataSet(entries: entries, label: chartlabel)
        dataSet.colors = ColorPalette().chartColors
        return BarChartData(dataSet: dataSet)
    }
}

// MARK: - Helper
extension BarChartViewModel {
    
    init(with lifeExpectency: LifeExpectency) {
        let maleEntry = BarChartDataEntry(x: 1.0, y: lifeExpectency.males)
        let femaleEntry = BarChartDataEntry(x: 2.0, y: lifeExpectency.females)
        let bothEntry = BarChartDataEntry(x: 3.0, y: lifeExpectency.both)
        entries = [maleEntry, femaleEntry, bothEntry]
        chartlabel = "Life Expectency in Years"
        chartDescription = lifeExpectency.country
    }
}
