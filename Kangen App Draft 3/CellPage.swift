//
//  CellPage.swift
//  Kangen App Draft 2
//
//  Created by Stirling Yiin on 09/02/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class CellPage: UIViewController, UIScrollViewDelegate, UINavigationControllerDelegate {
    
    
    //PROPERTIES & OUTLETS
    @IBOutlet weak var machineSpecs: UIImageView?
    @IBOutlet weak var specScrollView: UIScrollView!
    @IBOutlet weak var navBarTitle: UINavigationItem!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var priceHeader: UILabel!
    
    private var _modelData: CellModel!
    
    var modelData: CellModel {
        get {
            return _modelData
        } set {
            _modelData = newValue
        }
    }
    
    
    //FUNCTIONS
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return machineSpecs
    }
    
    func setZoomScale() {
        
        specScrollView.delegate = self
    
        var minZoom = min(self.specScrollView.bounds.size.width / machineSpecs!.bounds.size.width, self.specScrollView.bounds.size.height / machineSpecs!.bounds.size.height);
        
        let zoomScaleCalculation = self.specScrollView.frame.size.height/(self.machineSpecs?.frame.size.height)!
        
        
        let widthScale = self.specScrollView.bounds.size.width / (machineSpecs?.bounds.size.width)!
        let heightScale = self.specScrollView.bounds.size.height / (machineSpecs?.bounds.size.height)!
        let minScale = min(widthScale, heightScale)
        
        
        specScrollView.zoomScale = minScale
        print("Zoom Scale Calculation is: \(minScale)")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Update UI Based on data inside modelData
        navBarTitle.title = modelData.title
        price.text = modelData.price
        
        //IF SPECS AVAILABLE, USE. OTHERWISE, LOAD VIDEO
        if modelData.specImage != nil {
            machineSpecs!.image = modelData.specImage
        } else {
            machineSpecs?.isHidden = true
        }
        
        //SCROLL VIEW CODE
        setZoomScale()
        
        //HIDE PRICE
        if price.text == nil {
            priceHeader.isHidden = true
        }
    }
    
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    
    //SAVE IMAGE
    @IBAction func tapImage(_ sender: Any) {
        
        if modelData.specImage != nil {
            let alert = UIAlertController(title: "Save Image", message: "Would you like to save this image to library?", preferredStyle: .alert)
            
            let saveAction = UIAlertAction(title: "Save", style: .default) {
                
                [unowned self] action in
                guard
                    let imageToSave = self.machineSpecs?.image else {
                        return
                }
                UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .default)
            
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
        }
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
