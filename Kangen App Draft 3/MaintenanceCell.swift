//
//  MaintenanceCell.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 21/04/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class MaintenanceCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(maintenanceObject: MaintenanceObject){
        cellTitle.text = maintenanceObject.maintenanceObjectTitle
        cellDescription.text = maintenanceObject.maintenanceObjectDescription
        cellImage.image = maintenanceObject.maintenanceObjectImage
    }

}
