//
//  TestimonialCellVC.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 16/04/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class TestimonialCellVC: UITableViewCell {
    
    

    @IBOutlet weak var testimonialImage: UIImageView!
    @IBOutlet weak var testimonialName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(testimonial: Testimonial){
        testimonialName.text = testimonial.name
        testimonialImage.image = testimonial.image
    }



}
