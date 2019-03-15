//
//  TestimonialTableVC.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 15/04/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit
import os.log

class TestimonialTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayOfTestimonials = [Testimonial]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        if let savedTestimonials = loadTestimonials() {
            arrayOfTestimonials += savedTestimonials
        } else {
            loadSampleTestimonials()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Table functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTestimonials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Testimonial Cell", for: indexPath) as? TestimonialCellVC
        let cellData = arrayOfTestimonials[indexPath.row]
        cell?.updateCell(testimonial: cellData)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayOfTestimonials.remove(at: indexPath.row)
            saveTestimonials()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Segue functions
    @IBAction func unwindToTestimonialTable(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? TestimonialVC {
            let testimonial = Testimonial(name: (sourceViewController.nameTextField.text)!, testimonial: (sourceViewController.testimonialTextView.text)!, image: (sourceViewController.testimonialImageView.image)!)
            
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    // Update an existing meal.
                    arrayOfTestimonials[selectedIndexPath.row] = testimonial
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
                else {
                    // Add a new meal.
                    let newIndexPath = IndexPath(row: arrayOfTestimonials.count, section: 0)
                    
                    arrayOfTestimonials.append(testimonial)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            
            saveTestimonials()
            }        
    }
    
    //MARK: Segue functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Existing Testimonial Segue":
            guard let destination = segue.destination as? TestimonialVC else {
                fatalError()
            }
            guard let selectedCell = sender as? TestimonialCellVC else {
                fatalError()
            }
            
            let indexPath = tableView.indexPath(for: selectedCell)
            let dataHere = arrayOfTestimonials[(indexPath?.row)!]
            destination.theTestimonial = dataHere
            
        default: break
            
        }
    }
    
    //MARK: Load & save testimonial samples
    
    func loadSampleTestimonials(){
        let testimonial1 = UIImage(named: "Cancer Testimonial")
        let t1 = Testimonial(name: "Joan Mary, 33, Singapore", testimonial:"Kangen Water Is The Best", image: testimonial1! )
        arrayOfTestimonials.append(t1)
    }
    
    private func loadTestimonials() -> [Testimonial]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Testimonial.ArchiveURL.path) as? [Testimonial]
    }
    
    func saveTestimonials() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(arrayOfTestimonials, toFile: Testimonial.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("Testimonials saved successfully.", log: OSLog.default, type: .debug)
        } else {
            os_log("Testimonials NOT saved successfully.", log: OSLog.default, type: .error)
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
