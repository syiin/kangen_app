//
//  TableViewCell.swift
//  Kangen App Draft 2
//
//  Created by Stirling Yiin on 09/02/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(cellModelInfo: CellModel) {
        cellTitle.text = cellModelInfo.title
        cellImage.image = cellModelInfo.image
    }

}
