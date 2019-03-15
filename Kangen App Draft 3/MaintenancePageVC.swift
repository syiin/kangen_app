//
//  MaintenancePageVC.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 21/04/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class MaintenancePageVC: UIViewController {

    private var _maintenanceObject: MaintenanceObject!
    
    var maintenanceObject: MaintenanceObject {
        get {
            return _maintenanceObject
        } set {
            _maintenanceObject = newValue
        }
    }
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var navBarTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarTitle.title = maintenanceObject.maintenanceObjectTitle
        webView.loadHTMLString(maintenanceObject.maintenanceObjectURL, baseURL: nil)
        descriptionLabel.text = maintenanceObject.maintenanceObjectDescription

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
