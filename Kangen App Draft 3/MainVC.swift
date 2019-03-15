//
//  ViewController.swift
//  Kangen App Draft 2
//
//  Created by Stirling Yiin on 09/02/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tableCellArray = [CellModel]()
    var otherTableCellArray = [CellModel]()
    var country: CountryTracker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch country.country{
        case "Malaysia":
            loadMYData()
        case "Singapore":
            loadSGData()
        case "India":
            loadIndiaData()
        case "USA":
            loadUSData()
        default: break
        }
        
        //TABLE DELEGATE & DATASOURCE
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //DATA SOURCE FOR TABLE VIEW
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Machine Specifications"
        case 1:
            return "Other Resources"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        
        switch indexPath.section {
        case 0:
            let tableQueueCell = tableCellArray[indexPath.row]
            cell?.updateUI(cellModelInfo: tableQueueCell)
            return cell!
        case 1:
            let tableQueueCell = otherTableCellArray[indexPath.row]
            cell?.updateUI(cellModelInfo: tableQueueCell)
            return cell!
        default:
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return tableCellArray.count
        case 1:
            return otherTableCellArray.count
        default:
            return 0
        }
    }
    
    //TRANSMIT DATA FROM MAIN VIEW THROUGH SEGUE TO CELLPAGE VIEW
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section{
        case 0:
            let segueInfo = tableCellArray[indexPath.row]
            performSegue(withIdentifier: "cellSegue", sender: segueInfo)
        case 1:
            let segueInfo = otherTableCellArray[indexPath.row]
            if indexPath.row < 2 {
                performSegue(withIdentifier: "showVideo", sender: segueInfo)
            } else if indexPath.row == 3{
                performSegue(withIdentifier: "certificateSegue", sender: segueInfo)
            } else {
                performSegue(withIdentifier: "otherSegue", sender: segueInfo)
            }
        default: break
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier ?? ""{
            
            case "cellSegue":
                if let destination = segue.destination as? UINavigationController {
                    if let dataHere = sender as? CellModel {
                        let destinationVC = destination.viewControllers.first as! CellPage
                        destinationVC.modelData = dataHere
                    }
            }
            
            case "otherSegue":
                    if let destination = segue.destination as? CellPaymentInfoPage {
                        if let dataHere = sender as? CellModel {
                                destination.modelData = dataHere
                        }
                    }
            
        case "showVideo":
            if let destination = segue.destination as? UINavigationController {
                if let dataHere = sender as? CellModel {
                    let destinationVC = destination.viewControllers.first as! CellVideoPage
                    destinationVC.modelData = dataHere
                }
            }
            
        default: break
            
        }

    }
    
    //DATA FUNCTIONS - DIFFERENTIATED BY COUNTRY
    
    func loadUSData() {
        //LOAD DATA FOR MACHINE SPECS & DEMO VIDEOS
        let c1 = CellModel(
            title: "JR II Specifications",
            image: UIImage(named: "JRIImachine")!,
            specImage: UIImage(named: "JRII")!,
            price: "USD2,380.00")
        
        let c2 = CellModel(
            title: "SD501 Specifications",
            image: UIImage(named: "sd501machine")!,
            specImage: UIImage(named: "SD501")!,
            price: "USD3,980.00")
        
        let c3 = CellModel(
            title: "K8 Specifications",
            image: UIImage(named: "K8machine")!,
            specImage: UIImage(named: "K8")!,
            price: "USD4,980.00")
        
        let c7 = CellModel(
            title: "UKON Supplements DD",
            image: UIImage(named: "UKONCaps")!,
            specImage: UIImage(named: "UKON")!,
            price: "USD760.00")
        
        let c8 = CellModel(
            title: "ANESPA",
            image: UIImage(named: "ANESPA")!,
            specImage: UIImage(named: "ANESPASpecs")!,
            price: "USD2,390.00")
        
        tableCellArray.append(c1!)
        tableCellArray.append(c2!)
        tableCellArray.append(c3!)
        tableCellArray.append(c7!)
        tableCellArray.append(c8!)
        
        
        //LOAD DATA FOR MACHINE PRICING & PAYMENT
        
        let c4 = CellModel(
            title: "Kangen Demo",
            image: UIImage(named: "enagiclogo")!,
            videoURL: "<iframe width=\"100%\" height=\"315\" src=\"https://player.vimeo.com/video/120670858\" frameborder=\"0\" allowfullscreen></iframe>")
        
        let c6 = CellModel(
            title: "General Presentation",
            image: UIImage(named: "enagiclogo")!,
            videoURL: "<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/_rQqwYRk6zE\" frameborder=\"0\" allowfullscreen></iframe>")
        
        let p1 = CellModel(
            title: "Payment Options",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"USPaymentOptions")!)
        
        let p2 = CellModel(
            title: "Enagic Product Certificates",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"Enagic Certificates")!)
        
        let waterUses = CellModel(
            title: "Kangen Water Applications",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"KangenWP1")!)
        
        otherTableCellArray.append(c6!)
        otherTableCellArray.append(c4!)
        otherTableCellArray.append(p1!)
        otherTableCellArray.append(p2!)
        otherTableCellArray.append(waterUses!)
        
    }
    
    
    func loadIndiaData() {
        //LOAD DATA FOR MACHINE SPECS & DEMO VIDEOS
        let c1 = CellModel(
            title: "JR II Specifications",
            image: UIImage(named: "JRIImachine")!,
            specImage: UIImage(named: "JRII")!,
            price: "Rs 150500/-")
        
        let c2 = CellModel(
            title: "SD501 Specifications",
            image: UIImage(named: "sd501machine")!,
            specImage: UIImage(named: "SD501")!,
            price: "Rs 268500/-")
        
        let c3 = CellModel(
            title: "K8 Specifications",
            image: UIImage(named: "K8machine")!,
            specImage: UIImage(named: "K8")!,
            price: "Rs 333500/-")
        
        let c7 = CellModel(
            title: "LeveLuk SUPER501",
            image: UIImage(named: "Super501machine")!,
            specImage: UIImage(named: "Super501 Specs")!,
            price: "RRs 385500/-")
        
        let c8 = CellModel(
            title: "ANESPA",
            image: UIImage(named: "ANESPA")!,
            specImage: UIImage(named: "ANESPASpecs")!,
            price: "Rs 150500/-")
        
        tableCellArray.append(c1!)
        tableCellArray.append(c2!)
        tableCellArray.append(c3!)
        tableCellArray.append(c7!)
        tableCellArray.append(c8!)
        
        //LOAD DATA FOR MACHINE PRICING & PAYMENT
        
        let c4 = CellModel(
            title: "Kangen Demo",
            image: UIImage(named: "enagiclogo")!,
            videoURL: "<iframe width=\"100%\" height=\"315\" src=\"https://player.vimeo.com/video/120670858\" frameborder=\"0\" allowfullscreen></iframe>")
        
        let c6 = CellModel(
            title: "General Presentation",
            image: UIImage(named: "enagiclogo")!,
            videoURL: "<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/_rQqwYRk6zE\" frameborder=\"0\" allowfullscreen></iframe>")
        
        let p1 = CellModel(
            title: "Payment Options",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"India Product Order")!)
        
        let p2 = CellModel(
            title: "Enagic Product Certificates",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"Enagic Certificates")!)
        
        let waterUses = CellModel(
            title: "Kangen Water Applications",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"KangenWP1")!)
        
        otherTableCellArray.append(c6!)
        otherTableCellArray.append(c4!)
        otherTableCellArray.append(p1!)
        otherTableCellArray.append(p2!)
        otherTableCellArray.append(waterUses!)
        
    }

    
    func loadMYData() {
        //LOAD DATA FOR MACHINE SPECS & DEMO VIDEOS
        let c1 = CellModel(
            title: "JR II Specifications",
            image: UIImage(named: "JRIImachine")!,
            specImage: UIImage(named: "JRII")!,
            price: "RM7208")
        
        let c2 = CellModel(
            title: "SD501 Specifications",
            image: UIImage(named: "sd501machine")!,
            specImage: UIImage(named: "SD501")!,
            price: "RM12,780")
        
        let c3 = CellModel(
            title: "K8 Specifications",
            image: UIImage(named: "K8machine")!,
            specImage: UIImage(named: "K8")!,
            price: "RM16,960")
        
        let c7 = CellModel(
            title: "UKON Supplement",
            image: UIImage(named: "UKONCaps")!,
            specImage: UIImage(named: "UKON")!,
            price: "RM280")
        
        let c8 = CellModel(
            title: "ANESPA",
            image: UIImage(named: "ANESPA")!,
            specImage: UIImage(named: "ANESPASpecs")!,
            price: "RM7,208")
        
        tableCellArray.append(c1!)
        tableCellArray.append(c2!)
        tableCellArray.append(c3!)
        tableCellArray.append(c7!)
        tableCellArray.append(c8!)

        
        //LOAD DATA FOR MACHINE PRICING & PAYMENT
        
        let c4 = CellModel(
            title: "Kangen Demo",
            image: UIImage(named: "enagiclogo")!,
            videoURL: "<iframe width=\"100%\" height=\"315\" src=\"https://player.vimeo.com/video/120670858\" frameborder=\"0\" allowfullscreen></iframe>")
        
        let c6 = CellModel(
            title: "General Presentation",
            image: UIImage(named: "enagiclogo")!,
            videoURL: "<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/_rQqwYRk6zE\" frameborder=\"0\" allowfullscreen></iframe>")
        
        let p1 = CellModel(
            title: "Payment Options",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"ENAGIC PRODUCT ORDER")!)
        
        let p2 = CellModel(
            title: "Enagic Product Certificates",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"Enagic Certificates")!)
        
        let waterUses = CellModel(
            title: "Kangen Water Applications",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"KangenWP1")!)

        otherTableCellArray.append(c6!)
        otherTableCellArray.append(c4!)
        otherTableCellArray.append(p1!)
        otherTableCellArray.append(p2!)
        otherTableCellArray.append(waterUses!)
        
    }
    
    func loadSGData() {
        //LOAD DATA FOR MACHINE SPECS & DEMO VIDEOS
        let c1 = CellModel(
            title: "JR II Specifications",
            image: UIImage(named: "JRIImachine")!,
            specImage: UIImage(named: "JRII")!,
            price: "SGD2,921.10")
        
        let c2 = CellModel(
            title: "SD501 Specifications",
            image: UIImage(named: "sd501machine")!,
            specImage: UIImage(named: "SD501")!,
            price: "SGD5,285.80")
        
        let c3 = CellModel(
            title: "K8 Specifications",
            image: UIImage(named: "K8machine")!,
            specImage: UIImage(named: "K8")!,
            price: "SGD6,687.50")
        
        let c7 = CellModel(
            title: "UKON Supplement",
            image: UIImage(named: "UKONCaps")!,
            specImage: UIImage(named: "UKON")!,
            price: "SGD165.00")
        
        let c8 = CellModel(
            title: "ANESPA",
            image: UIImage(named: "ANESPA")!,
            specImage: UIImage(named: "ANESPASpecs")!,
            price: "SGD2,921.10")
        
        tableCellArray.append(c1!)
        tableCellArray.append(c2!)
        tableCellArray.append(c3!)
        tableCellArray.append(c7!)
        tableCellArray.append(c8!)

        
        //LOAD DATA FOR MACHINE PRICING & PAYMENT
        
        let c4 = CellModel(
            title: "Kangen Demo",
            image: UIImage(named: "KWS Logo-1")!,
            videoURL: "<iframe width=\"100%\" height=\"315\" src=\"https://player.vimeo.com/video/120670858\" frameborder=\"0\" allowfullscreen></iframe>")
        
        let c6 = CellModel(
            title: "General Presentation",
            image: UIImage(named: "KWS Logo-1")!,
            videoURL: "<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/_rQqwYRk6zE\" frameborder=\"0\" allowfullscreen></iframe>")
        
        let p1my = CellModel(
            title: "Payment Options",
            image: UIImage(named: "dollar")!,
            specImage: UIImage(named:"ENAGIC PRODUCT ORDER")!)
        
        let p1sg = CellModel(
            title: "Payment Options",
            image: UIImage(named: "dollar")!,
            specImage: UIImage(named:"SINGAPORE APPLICATION FORM")!)
        
        let p2 = CellModel(
            title: "Enagic Product Certificates",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"Enagic Certificates")!)
        
        
        let waterUses = CellModel(
            title: "Kangen Water Applications",
            image: UIImage(named: "enagiclogo")!,
            specImage: UIImage(named:"KangenWP1")!)
        
        otherTableCellArray.append(c6!)
        otherTableCellArray.append(c4!)
        otherTableCellArray.append(p1sg!)
        otherTableCellArray.append(p2!)
        otherTableCellArray.append(waterUses!)
        
        
        //MISC RESOURCES
        //let c6 = CellModel(
          //  title: "General Presentation",
           // image: UIImage(named: "KWS Logo-1")!,
            //videoURL: "<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/_rQqwYRk6zE\" frameborder=\"0\" allowfullscreen></iframe>")
    }
    
    //Add WQA, WQA Video, JAPPA, WQA (Gold Seal)


}
