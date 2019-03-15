//
//  MaintenanceObject.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 21/04/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import Foundation
import UIKit

class MaintenanceObject {
    var maintenanceObjectTitle: String
    var maintenanceObjectURL: String
    var maintenanceObjectDescription: String
    var maintenanceObjectImage: UIImage
    
    init(title: String, description: String, URL: String, image: UIImage) {
        self.maintenanceObjectTitle = title
        self.maintenanceObjectDescription = description
        self.maintenanceObjectURL = URL
        self.maintenanceObjectImage = image
    }
}
