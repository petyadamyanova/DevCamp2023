//
//  NAmeViewController.swift
//  24.07.23
//
//  Created by Student on 24.07.23.
//

import Foundation
import UIKit



class NameViewController: UIViewController{
    @IBOutlet weak var textFieldForName: UITextField!
    
    var nameCompleton: ((String) -> Void)?
    var coordinator: GreetingCoordinator?
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        let name = textFieldForName.text ?? ""
        nameCompleton?(name)
        coordinator?.navigationController.popViewController(animated: true)
        
    }
    
}
