//
//  ViewController.swift
//  FoodManagement2024
//
//  Created by DaiTran on 20/4/24.
//

import UIKit

//Step 1. integrate delegated functions of UITextfield into ↓ defining class
class MealDetailController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //MARK: Properties

    @IBOutlet weak var mealName: UITextField!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealRating: UIRating!
    @IBOutlet weak var navigation: UINavigationItem!
    
    //Meal variable uses for passing by reference between 2 screen
    var meal: Meal?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //kiểm tra biến meal được giao đến từ edit action
        if let meal = meal {
            navigation.title = meal.name
            mealName.text = meal.name
            mealRating.ratingValue = meal.rating
        }
        
       //Step 3. Delegate assigned for mealName
        mealName.delegate = self
        
        
    }
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    //MARK: Define delegated functions of UIImagePickerController
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage{
            mealImage.image = image
        }
            
    }

    //MARK: Define delegated functions of UITextField ↓
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide keyboard
        mealName.resignFirstResponder()
        return true
    }
    // Will be called when editing action end
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\(mealName.text!)")
    }
    
    //MARK: Get an action for retrieving an image from the library using an ImageView.
        
    @IBAction func imagePicker(_ sender: UITapGestureRecognizer) {
        
        mealName.resignFirstResponder()
                
        let imagePicker =  UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
        
                                
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("prepare B")
        meal = Meal(name: mealName.text ?? "", image: mealImage.image, rating: mealRating.ratingValue)
        
    }
  
}

