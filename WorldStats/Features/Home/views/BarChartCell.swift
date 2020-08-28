/*
 *	BarChartCell.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit
import Charts

// MARK: - Definitions -

// MARK: - Type -

class BarChartCell : UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet var barChartView: BarChartView!
    @IBOutlet var slider: UISlider!
    
    // MARK: - Optional Closure
    var onSliderChange: ((Int) -> Void)?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
