//
//  SecondViewController.swift
//  app
//
//  Created by Student on 21.07.23.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var PasswordField: UILabel!
    @IBOutlet weak var GmailField: UILabel!
    @IBOutlet weak var textFieldVC2: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var SecondName: UILabel!
    
    
    weak var delegate: SecondViewControllerDelegate?

    var receivedText: String = ""
    
    var FirstName: String = ""
    var LastName: String = ""
    var Gmail: String = ""
    var Password: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "First name: " + FirstName
        SecondName.text = "Last name: " + LastName
        GmailField.text = "Gmailll: " + Gmail
        PasswordField.text = "Password: " + Password
    }
    
    @IBAction func ResetButtonAction(_ sender: Any) {
        let firstViewController = presentingViewController as? ViewController
        firstViewController?.resetFileds()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SubmitButtonAction(_ sender: Any) {
        delegate?.updateMsg(textFieldVC2.text ?? "")
    }
}

protocol SecondViewControllerDelegate: AnyObject{
    func updateMsg(_ message: String)
}
