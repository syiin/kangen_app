//
//  OrderFormVC.swift
//  Kangen App Draft 2
//
//  Created by Stirling Yiin on 12/02/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class OrderFormVC: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UIScrollViewDelegate {
    
    //VARIABLES FROM TEXT FIELDS
    var nameFieldText: String!
    var contactNumberText: String!
    var emailAddressText: String!
    var distributorEmailAddressText: String!
    var machineModelText: String!
    var paymentMethodText:String!
    
    //UI DECLARATIONS
    
    @IBOutlet weak var formStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var contactNumber: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var distributorEmailAddress: UITextField!
    @IBOutlet weak var machineModel: UITextField!
    @IBOutlet weak var paymentMethod: UITextField!
    @IBAction func confirmButtonPressed(_ sender: Any) {
        
        nameFieldText = nameField.text
        contactNumberText = contactNumber.text
        emailAddressText = emailAddress.text
        distributorEmailAddressText = distributorEmailAddress.text
        machineModelText = machineModel.text
        paymentMethodText = paymentMethod.text
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //TEXT FIELD DELEGATE FUNCTIONS
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SET TEXTFIELD DELEGATES
        self.nameField.delegate = self
        self.contactNumber.delegate = self
        self.emailAddress.delegate = self
        self.distributorEmailAddress.delegate = self
        self.machineModel.delegate = self
        self.paymentMethod.delegate = self
        
        //SCROLL FIELD DELEGATE
        scrollView.delegate = self
    }
    
    //MAIL COMPOSE VIEW FUNCTIONS
 
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["\(distributorEmailAddressText)"])
        mailComposerVC.setSubject("Kangen App Order Form")
        mailComposerVC.setMessageBody("Name: \(nameFieldText!)\n Contact No:\(contactNumberText!)\n Email Address:\(emailAddressText!) \n Machine Model:\(machineModelText!) \n Payment Method:\(paymentMethodText!)" , isHTML: false)
        
        return mailComposerVC
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
