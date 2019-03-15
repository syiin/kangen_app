//
//  certImageViewController.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 09/03/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class certImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var theCertImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var certItem: CertItem!
    var certIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        let widthScale = self.scrollView.bounds.size.width / (theCertImage?.bounds.size.width)!
        let heightScale = self.scrollView.bounds.size.height / (theCertImage?.bounds.size.height)!
        let minScale = min(widthScale, heightScale)
        scrollView.zoomScale = minScale
        theCertImage.image = certItem.image
        titleLabel.text = certItem.title
    
    }
    //SCROLL FUNCTIONS
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return theCertImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
