//
//  Testimonial.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 11/04/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import Foundation
import UIKit

class Testimonial: NSObject, NSCoding {
    
    var name: String
    var image: UIImage?
    var testimonial: String
    
    init(name: String, testimonial: String) {
        self.name = name
        self.testimonial = testimonial
    }
    
    init(name: String, testimonial: String, image: UIImage) {
        self.name = name
        self.testimonial = testimonial
        self.image = image
    }
    
    //ARCHIVING PATHS
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("testimonials")
    
    //TYPES
    
    struct PropertyKey {
        static let name = "name"
        static let image = "image"
        static let testimonial = "testimonial"
    }
    
    //NSCODING
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(image, forKey: PropertyKey.image)
        aCoder.encode(testimonial, forKey: PropertyKey.testimonial)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        guard let nameOfTestimonial = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            return nil
        }

        let image = aDecoder.decodeObject(forKey: PropertyKey.image)
        let testimonial = aDecoder.decodeObject(forKey: PropertyKey.testimonial)
        
        self.init(name: nameOfTestimonial, testimonial: testimonial as! String, image: image as! UIImage)
    }

    
}
