//
//  TestimonialVC.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 15/04/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class TestimonialVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var testimonialImageView: UIImageView!
    @IBOutlet weak var testimonialTextView: UITextView!
    
    var theTestimonial: Testimonial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        testimonialTextView.delegate = self
        
        if theTestimonial != nil{
            nameTextField.text = theTestimonial?.name
            testimonialImageView.image = theTestimonial?.image
            testimonialTextView.text = theTestimonial?.testimonial
        }
    }
    
    //MARK: Textfield Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        theTestimonial?.name = nameTextField.text!
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        navigationItem.title = textField.text
    }
    
    //MARK: Image Picker Functions
    
    @IBAction func tapImageView(_ sender: Any) {
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        testimonialImageView.image = selectedImage
        theTestimonial?.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    

    
    func textViewDidEndEditing(_ textView: UITextView) {
        theTestimonial?.testimonial = textView.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
