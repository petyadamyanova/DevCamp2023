//
//  GreetingViewController.swift
//  24.07.23
//
//  Created by Student on 24.07.23.
//

import Foundation

import UIKit

class GreetingViewController: UIViewController {
    var coordinator: GreetingCoordinator?
    var nameCompletion: ((String) -> Void)?
    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Greeting"
        
        let addNameButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addName))
        
        navigationItem.rightBarButtonItem = addNameButton
    }
    
    @IBAction func addName(_ sender: UIButton) {
        coordinator?.addName(completion: { [weak self] name in self?.nameCompletion?(name)
            
            self?.greetingLabel.text = "Hello, " + name
            
        })
        
        
                             
    }
}
