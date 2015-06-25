//
//  AddImageViewController.swift
//  SimplePersistenceExample
//
//  Created by Jason Hoffman on 5/28/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTextField.delegate = self
        self.imagePicker.delegate = self
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickImage(sender: UIBarButtonItem) {
        if sender.tag == 200 {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                imagePicker.sourceType = .Camera
                imagePicker.showsCameraControls = true
                self.presentViewController(imagePicker, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "No camera?", message: "Your camera doesn't seem to be available.", preferredStyle: .Alert)
                let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(alertAction)
                self.presentViewController(alertController, animated: true, completion:nil)
            }
        } else if sender.tag == 201 {
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        let store = StuffStore.sharedStore
        if let img = self.imageView.image {
            store.createStuff(self.titleTextField.text, stuffImage: img)
            store.saveStuff()
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.titleTextField.resignFirstResponder()
        return true
    }
}
