//
//  ViewController.swift
//  WorldStats
//
//  Created by Emirates on 8/28/20.
//  Copyright © 2020 Fahied. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    enum Rows: String, CaseIterable {
        case pieChart
        case barChart
        case camera
        
        var cellIdentifier: String {
            self.rawValue
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Rows.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let rowType = Rows.allCases[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rowType.cellIdentifier, for: indexPath)
        return cell
    }
}

