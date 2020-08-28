/*
 *	PieChartCell.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit
import Charts
// MARK: - Definitions -

// MARK: - Type -

class PieChartCell : UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet var pieChartView: PieChartView!
    @IBOutlet var stepper: UIStepper!
    
    // MARK: - life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        //add shadow
        pieChartView.chartDescription?.font = UIFont.systemFont(ofSize: 18)
    }
    
}
