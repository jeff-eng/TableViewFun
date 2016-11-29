//
//  MealViewController.swift
//  Food Tracker
//
//  Created by Jeffrey Eng on 11/3/16.
//  Copyright © 2016 Jeffrey Eng. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    /*
     This value is either passed by 'MealTableViewController' in 'prepareForSegue(_:sender:)' or constructed as part of adding a new meal.
     */
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks. Self refers to the ViewController class because its inside the scope of the ViewController class definition.
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        // Returning true indicates text field should respond to the user pressing Return key by dismissing the keyboard
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the image picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.  Takes the original image and casts it as a UIImage and saves to the constant selectedImage.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton === sender as AnyObject? {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to be passed to MealTableViewController after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Makes sure the keyboard is dismissed when user taps on the image view
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library. Creates an instance of UIImagePickerController object
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        // Method asks ViewController to present the view controller defined by imagePickerController which is photo library because it was defined above
        present(imagePickerController, animated: true, completion: nil)
    }
    
}

