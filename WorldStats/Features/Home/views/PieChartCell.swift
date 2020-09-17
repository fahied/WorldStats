/*
 *	PieChartCell.swift
 *	WorldStats
 *
 *	Created by Muhammad Fahied on 8/28/20.
 *	Copyright 2020 Fahied. All rights reserved.
 */

import UIKit
import Charts

// MARK: - Protocol
protocol PieChartCellDelegate: AnyObject {
    func didChange(cell: PieChartCell, steppervalue: Int)
}

class PieChartCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet var pieChartView: PieChartView!
    @IBOutlet var stepper: UIStepper!
    
    // MARK: - Properties
    weak var delegate: PieChartCellDelegate?
    
    // MARK: - life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        //add shadow
        pieChartView.chartDescription?.font = UIFont.systemFont(ofSize: 18)
    }
    
    // MARK: - Exposed functions
    func configure(viewModel: PieChartViewModel) {
        pieChartView.data = viewModel.data
        pieChartView.chartDescription?.text = viewModel.chartDescription
        pieChartView.notifyDataSetChanged()
    }
    
    // MARK: - Target Action
    @IBAction func stepperTapped(_ sender: UIStepper) {
        delegate?.didChange(cell: self, steppervalue: Int(sender.value))
    }
}
