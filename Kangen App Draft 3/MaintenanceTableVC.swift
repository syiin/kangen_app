//
//  MaintenanceVCViewController.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 21/04/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class MaintenanceTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayOfMaintenanceObjects = [MaintenanceObject]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    //MARK: Table View Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMaintenanceObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Maintenance Cell", for: indexPath) as? MaintenanceCell
        
        let cellMaintenanceObject = arrayOfMaintenanceObjects[indexPath.row]
        
        cell?.updateCell(maintenanceObject: cellMaintenanceObject)
        return cell!
    }
    
 
    
    //MARK: Segue functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "Maintenance Page Segue":
        guard let destination = segue.destination as? MaintenancePageVC else {
            fatalError()
        }
        
        guard let selectedCell = sender as? MaintenanceCell else {
            fatalError()
        }
        
        let indexPath = tableView.indexPath(for: selectedCell)
        let dataHere = arrayOfMaintenanceObjects[(indexPath?.row)!]
        
        destination.maintenanceObject = dataHere
        
        default: break
        }
    }
    
    //MARK: Load Data
    
    func loadData(){
        
        let ecleaning = MaintenanceObject(title: "E-Cleaning Guide", description: "Every 2 months", URL: "<iframe align=\"middle\" width=\"100%\" height=\"330\" src=\"https://www.youtube.com/embed/jZbwV5by0pk\" frameborder=\"0\" allowfullscreen></iframe>", image: UIImage(named: "enagiclogo")!)
        
        let filterchange = MaintenanceObject(title: "Filter Changes", description: "Every 6000L", URL: "<iframe align=\"middle\" width=\"100%\" height=\"330\" src=\"https://www.youtube.com/embed/DbSwl5TXonw\" frameborder=\"0\" allowfullscreen></iframe>", image: UIImage(named: "enagiclogo")!)
        
        let deepcleaning = MaintenanceObject(title: "Deep Cleaning", description: "\"Deep Clean\" your Enagic ERW(Electrolyzed Reduced Water) machine. This method uses current/friction to enhance the clean better than the standard method. You'll need; distilled white vinegar, e-cleaner or Food-grade citric acid, a bucket with a lid(the smaller the better), a NEW fountain pump(3-6ft), approx 8's of 1/2\" INT hosing, (2) 1/2\" hose clamps, Enagic cleaner cartridge. To modify your cleaner cartridge, simply use a drill bit and drill it out from the bottom.",
            URL: "<iframe align=\"middle\" width=\"100%\" height=\"330\" src=\"https://www.youtube.com/embed/I0kvjEqujBg\" frameborder=\"0\" allowfullscreen></iframe>", image: UIImage(named: "enagiclogo")!)
        
        arrayOfMaintenanceObjects.append(filterchange)
        arrayOfMaintenanceObjects.append(ecleaning)
        arrayOfMaintenanceObjects.append(deepcleaning)
        
    }
    

}
