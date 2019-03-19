//
//  ItemCell.swift
//  CollectionView
//
//  Created by Tiala Rocha on 19/03/2019.
//  Copyright © 2019 Tiala Rocha. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    
    @IBOutlet weak var textLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(text: String){
        self.textLabel.text = text
    }

}
