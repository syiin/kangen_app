//
//  CellPaymentInfoPage.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 26/02/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class CellPaymentInfoPage: UIViewController, UIScrollViewDelegate {

    private var _modelData: CellModel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var orderImage: UIImageView!
    
    var modelData: CellModel {
        get {
            return _modelData
        } set {
            _modelData = newValue
        }
    }
    
    //SCROLL FUNCTIONS
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return orderImage
    }
    
    func setZoomScale() {
        
        scrollView.delegate = self
        
        let widthScale = self.scrollView.bounds.size.width / (orderImage?.bounds.size.width)!
        let heightScale = self.scrollView.bounds.size.height / (orderImage?.bounds.size.height)!
        let minScale = min(widthScale, heightScale)
        
        
        scrollView.zoomScale = minScale
        print("Zoom Scale Calculation is: \(minScale)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = modelData.title
        
        orderImage.image = modelData.specImage
        
        scrollView.delegate = self
        setZoomScale()
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
