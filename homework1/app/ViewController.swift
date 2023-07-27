//
//  ViewController.swift
//  app
//
//  Created by Student on 20.07.23.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var gmailField: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var labelCv1: UILabel!
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var infoFromCv2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondVC" {
            if let destinationVC = segue.destination as? SecondViewController {
                destinationVC.FirstName = FirstNameTextField.text ?? ""
                destinationVC.LastName = lastName.text ?? ""
                destinationVC.Gmail = gmailField.text ?? ""
                destinationVC.Password = passwordField.text ?? ""
                destinationVC.delegate = self
            }
        }
    }
    
    func updateMsg(_ message: String){
        infoFromCv2.text = "message from cv2: " + message
    }
    
    func resetFileds(){
        FirstNameTextField.text = ""
        lastName.text = ""
        gmailField.text = ""
        passwordField.text = ""
    }
    

    @IBAction func ConfirmButtonTap(_ sender: Any) {
       
    }
    
}

