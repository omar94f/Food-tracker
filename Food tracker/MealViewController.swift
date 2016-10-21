//
//  ViewController.swift
//  Food tracker
//
//  Created by Omar Farooq on 10/17/16.
//  Copyright © 2016 Omar. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
   
    var meal: Meal?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
        checkValidMealName()
        if let selectedMeal = meal {
            navigationItem.title = selectedMeal.name
            nameTextField.text = selectedMeal.name
            imageView.image = selectedMeal.photo
        }
        
    }


    
    
    @IBAction func selectImageTapGesture(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
   
    
    // UITextField delegate callback
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidMealName()
        navigationItem.title = nameTextField.text
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

    
    // Mark: ImagePicker delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if  let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = selectImage
        }
        else{
            print("The image is empty")
        }
        dismiss(animated: true, completion: nil)
    }
    
    // Mark: Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? UIBarButtonItem === saveButton{
            let name = nameTextField.text ?? ""
            let photo = imageView.image!
            meal = Meal(name: name, pic: photo)
        }
    }
    
    @IBAction func cancelButtonPress(_ sender: AnyObject) {
        if let navigationViewController = presentingViewController as? UINavigationController{
            dismiss(animated: true, completion: nil)
        }
        else{
            navigationController!.popViewController(animated: true)
        }
    }
}

