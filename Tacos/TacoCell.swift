//
//  TacoCell.swift
//  Tacos
//
//  Created by shashank kannam on 1/7/17.
//  Copyright © 2017 shashank kannam. All rights reserved.
//

import UIKit

class TacoCell: UICollectionViewCell{

    @IBOutlet weak var tacoImageView: UIImageView!
    
    @IBOutlet weak var tacoLabel: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    func configurCell(taco: Taco){
        tacoImageView.image = UIImage(named:"\(taco.proteinId.rawValue)_Tacos")
        tacoLabel.text = taco.productname
    }
    
    
}
