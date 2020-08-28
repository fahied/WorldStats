/*
 *	PieChartViewModel.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit
import Charts

struct PieChartViewModel {
    
    // MARK: - Properties
    let entries: [PieChartDataEntry]
    let chartlabel: String
    let chartDescription: String
    let colors: [UIColor]
    
    var data: PieChartData {
        let dataSet  = PieChartDataSet(entries: entries, label: chartlabel)
        dataSet.colors = colors
        return PieChartData(dataSet: dataSet)
    }
}

// MARK: - Helper
extension PieChartViewModel {
    
    init(with lifeExpectency: LifeExpectency) {
        let maleEntry = PieChartDataEntry(value: lifeExpectency.males, label: "Male")
        let femaleEntry = PieChartDataEntry(value: lifeExpectency.females, label: "Female")
        let bothEntry = PieChartDataEntry(value: lifeExpectency.both, label: "Both")
        entries = [maleEntry, femaleEntry, bothEntry]
        chartlabel = "Life Expectency in Years"
        chartDescription = lifeExpectency.country
        colors = ColorPalette().chartColors
    }
}
