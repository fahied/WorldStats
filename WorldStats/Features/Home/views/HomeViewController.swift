//
//  ViewController.swift
//  WorldStats
//
//  Created by Emirates on 8/28/20.
//  Copyright © 2020 Fahied. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var collectionView: UICollectionView!
    
    private var viewModel: HomeViewModel
    private var camera: CameraType
    
    private enum Rows: String, CaseIterable {
        case pieChart
        case barChart
        case camera
        
        var cellIdentifier: String {
            return self.rawValue
        }
    }
    
    // MARK: - Initilizer with Dependency Injected
    init?(coder: NSCoder, viewModel: HomeViewModel, camera: CameraType) {
        self.viewModel = viewModel
        self.camera = camera
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a datasource and user.")
    }
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        // reload data from network and refresh view
        viewModel.reload {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Rows.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let rowType = Rows.allCases[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowType.cellIdentifier , for: indexPath)
        
        switch rowType {
            
        case .pieChart:
            if let pieCell = cell as? PieChartCell,
                let item = viewModel.item(at: indexPath.row) {
                pieCell.configure(viewModel: PieChartViewModel(with: item))
                //using delegate pattern to retrieve data
                pieCell.delegate = self
            }
            
        case .barChart:
            if let barCell = cell as? BarChartCell,
                let item = viewModel.item(at: indexPath.row) {
                let vm = BarChartViewModel(with: item)
                barCell.configure(viewModel:vm)
                barCell.slider.maximumValue = Float(viewModel.recordsCount - 1)
                // Using clousure to retrieve data
                barCell.onSliderChange =  { [weak self] value in
                    if let item = self?.viewModel.item(at: value) {
                        barCell.configure(viewModel: BarChartViewModel(with: item))
                    }
                }
            }
            
        case .camera:
            if let camCell = cell as? CameraCell {
                // Using Target-Action pattern to capture user action
                camCell.cameraButton.addTarget(self, action: #selector(showCamera), for: .touchUpInside)
                camera.onImageCaputured = {[weak camCell] image in
                    camCell?.imageView.image = image
                }
            }
        }
        return cell
    }
}

// MARK: - PieChartCellDelegate
extension HomeViewController: PieChartCellDelegate {
    func didChange(cell: PieChartCell, steppervalue: Int) {
        
        if let item = viewModel.item(at: steppervalue) {
            let viewModel = PieChartViewModel(with: item)
            cell.configure(viewModel: viewModel)
        }
    }
}

// MARK: - Camera Operations
extension HomeViewController {
    
    @objc func showCamera() {
        camera.showCamera(on: self)
    }
}

