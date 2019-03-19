//
//  ViewController.swift
//  CollectionView
//
//  Created by Tiala Rocha on 19/03/2019.
//  Copyright © 2019 Tiala Rocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataArray = ["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG"]
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates
        //self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //Register cells
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        //SetUp GridView
        self.setUpGridView()
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setUpGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    func setUpGridView(){
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        
    }

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setData(text: self.dataArray[indexPath.row])
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.calculateWith(), height: self.calculateWith())
    }
    
    func calculateWith() -> CGFloat{
        let estimateWidth = CGFloat(160.0)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimateWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}

