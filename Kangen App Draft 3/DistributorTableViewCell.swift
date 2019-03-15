//
//  DistributorTableViewCell.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 01/03/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class DistributorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableCellImage: UIImageView!
    @IBOutlet weak var tableCellTitle: UILabel!
    @IBOutlet weak var tableCellDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(cellModelInfo: CellModel){
        
        tableCellTitle.text = cellModelInfo.title
        tableCellImage.image = cellModelInfo.image
        tableCellDescription.text = cellModelInfo.details
        
        
    }

}
