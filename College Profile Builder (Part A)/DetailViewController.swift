//
//  DetailViewController.swift
//  College Profile Builder (Part A)
//
//  Created by Lesslie Garcia on 2/9/17.
//  Copyright © 2017 Lesslie Garcia. All rights reserved.
//

import UIKit
import RealmSwift
import SafariServices
class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var collegeNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    let realm = try! Realm()
    var detailItem: College? {
        didSet {
            self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        imagePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion:  {
            let selectedImage = info [UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        })
    }

    
    func configureView() {
        // Update the user interface for the detail item
        
        if let college = self.detailItem {
            if collegeNameTextField != nil {
                collegeNameTextField.text = college.collegeName
                locationTextField.text = college.location
                enrollmentTextField.text = String(college.enrollment)
                websiteTextField.text = String(college.website)
                imageView.image = UIImage(data: college.image)
            }
        }
    }
    
    @IBAction func onTappedSaveButton(_ sender: Any) {
        if let college = self.detailItem {
            try! realm.write({
                college.collegeName = collegeNameTextField.text!
                college.location = locationTextField.text!
                college.enrollment = Int(enrollmentTextField.text!)!
                college.website = websiteTextField.text!
                college.image = UIImagePNGRepresentation(imageView.image!)!
            })
        }
    }
    @IBAction func onTappedGoButton(_ sender: UIButton) {
        let urlString = websiteTextField.text!
        let url = URL(string: urlString)
        let svc = SFSafariViewController(url: url!)
        present(svc,animated: true, completion: nil)
    }
    
    @IBAction func onCameraButtonTapped(_ sender: Any) {
        if
            UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func onLibraryButtonTapped(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}
