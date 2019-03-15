//
//  menuPageVC.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 06/03/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class menuPageVC: UIViewController {
    
    var country: CountryTracker!
    var countryPressed: CountryTracker?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = country.country

        // Do any additional setup after loading the view.
    }

    @IBAction func machineSpecsButton(_ sender: Any) {
        countryPressed = country
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? MainVC
        
        destination?.country = countryPressed!
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
