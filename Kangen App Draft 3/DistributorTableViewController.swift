//
//  DistributorTableViewController.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 01/03/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class DistributorTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableItems = [CellModel]()

    @IBOutlet weak var tableView: UITableView!  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? DistributorTableViewCell
        
        let tableQueueCell = tableItems[indexPath.row]
        cell?.updateUI(cellModelInfo: tableQueueCell)

        return cell!
    }
    
    //TRANSMIT DATA TO SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
            case "Distributor Info Segue":
            guard let destinationSegue = segue.destination as? DistributorCellPage else {
            fatalError()
            }
            
            guard let selectedCell = sender as? DistributorTableViewCell else{
            fatalError()
            }
            
            let indexPath = tableView.indexPath(for: selectedCell)
            let dataHere = tableItems[(indexPath?.row)!]
            
            destinationSegue.modelData = dataHere
            
        default: break
        }
    }
    
    func loadData(){
    
        let c5 = CellModel(
            title: "Kangen Commission Plan",
            image: UIImage(named: "enagiclogo")!,
            videoURL: "<iframe src=\"https://www.youtube.com/embed/Q6tEY0lZwtE\" width=\"100%\" height=\"360\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
            details: "All About the Kangen Commission Plan"
        )
        
        let c6 = CellModel(
            title: "Kangen Pension Plan",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named: "Pension Plan")!,
            details: "What you can look forward to beyond 6A"
        )
        
        let p1 = CellModel(
            title: "Payment Options",
            image: UIImage(named: "dollar")!,
            specImage: UIImage(named:"ENAGIC PRODUCT ORDER")!,
            details:"The fastest ways to get your own Kangen Machine"
        )
    
        tableItems.append(c5!)
        tableItems.append(c6!)
        tableItems.append(p1!)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}



 
