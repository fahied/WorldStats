/*
 *	BarChartCell.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit
import Charts

class BarChartCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet var barChartView: BarChartView!
    @IBOutlet var slider: UISlider!
    
    // MARK: - Optional Closure
    var onSliderChange: ((Int) -> Void)?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        barChartView.chartDescription?.font = UIFont.systemFont(ofSize: 18)
        barChartView.chartDescription?.position = CGPoint(x: 100, y: 32)
    }
    
    // MARK: - Exposed Function
    func configure(viewModel: BarChartViewModel) {
        barChartView.data = viewModel.data
        barChartView.chartDescription?.text = viewModel.chartDescription
        barChartView.notifyDataSetChanged()
    }
    
    // MARK: - Target Action
    @IBAction func sliderMoved(_ sender: UISlider) {
        onSliderChange?(Int(sender.value))
    }
}
