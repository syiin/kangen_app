//
//  CellModel.swift
//  Kangen App Draft 2
//
//  Created by Stirling Yiin on 09/02/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import Foundation
import UIKit
import os.log

class CellModel {
    
    var title: String!
    var image: UIImage!
    var specImage: UIImage!
    var videoURL: String!
    var details: String!
    var price: String!
    
    struct PropertyKey {
        let title = "title"
        let image = "image"
        let specImage = "specImage"
        let videoURL = "videoURL"

    }
    
    init?(title: String, image: UIImage, specImage: UIImage, price: String){
        
        self.title = title
        self.image = image
        self.specImage = specImage
        self.price = price
 
    }
    
    init?(title: String, image: UIImage, videoURL: String){
        self.title = title
        self.image = image
        self.videoURL = videoURL
    }
    
    init?(title: String, image: UIImage, specImage: UIImage){
        self.title = title
        self.image = image
        self.specImage = specImage
    }
    
    init?(title: String, image: UIImage, videoURL: String, details: String){
        self.title = title
        self.image = image
        self.videoURL = videoURL
        self.details = details
    }
    
    init?(title: String, image: UIImage, specImage: UIImage, details: String){
        
        self.title = title
        self.image = image
        self.specImage = specImage
        self.details = details
        
    }
}


