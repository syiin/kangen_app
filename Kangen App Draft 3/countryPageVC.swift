//
//  countryPageVC.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 06/03/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class countryPageVC: UIViewController {

    @IBOutlet weak var malaysiaButton: UIButton!
    @IBOutlet weak var singaporeButton: UIButton!
    @IBOutlet weak var indiaButton: UIButton!
    @IBOutlet weak var usaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        malaysiaButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        singaporeButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        indiaButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        usaButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
    }

    var countryPressed: CountryTracker!

    @IBAction func myButton(_ sender: Any) {
        countryPressed = CountryTracker(country: "Malaysia")
        performSegue(withIdentifier: "segue", sender: sender)
        
    }
    
    @IBAction func sgButton(_ sender: Any) {
        countryPressed = CountryTracker(country: "Singapore")
        performSegue(withIdentifier: "segue", sender: sender)
    }
    
    @IBAction func indiaButton(_ sender: Any) {
        countryPressed = CountryTracker(country: "India")
        performSegue(withIdentifier: "segue", sender: sender)
    }
    
    @IBAction func usButton(_ sender: Any) {
        countryPressed = CountryTracker(country: "USA")
        performSegue(withIdentifier: "segue", sender: sender)
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as? menuPageVC
        
        destination?.country = countryPressed
        
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
