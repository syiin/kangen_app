//
//  DistributorCellPage.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 01/03/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class DistributorCellPage: UIViewController, UIScrollViewDelegate {
    
    private var _modelData: CellModel!
    
    var modelData: CellModel {
        get {
            return _modelData
        } set {
            _modelData = newValue
        }
    }

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var navBarTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Update UI Based on data inside modelData
        navBarTitle.title = modelData.title
        
        //IF SPECS AVAILABLE, USE. OTHERWISE, LOAD VIDEO
        if modelData.specImage != nil {
            imageView!.image = modelData.specImage
        } else {
            webView.isHidden = false
            webView.loadHTMLString(modelData.videoURL, baseURL: nil)
        }
        setZoomScale()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func setZoomScale() {
        
        scrollView.delegate = self
        
        let widthScale = self.scrollView.bounds.size.width / (imageView?.bounds.size.width)!
        let heightScale = self.scrollView.bounds.size.height / (imageView?.bounds.size.height)!
        let minScale = min(widthScale, heightScale)
        
        
        scrollView.zoomScale = minScale
        print("Zoom Scale Calculation is: \(minScale)")
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }

    @IBAction func tapImage(_ sender: Any) {
        let alert = UIAlertController(title: "Save Image", message: "Would you like to save this image to library?", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            
            [unowned self] action in
            guard
                let imageToSave = self.imageView?.image else {
                    return
            }
            UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
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
