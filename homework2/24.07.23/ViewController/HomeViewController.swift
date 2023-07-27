//
//  HomeViewController.swift
//  24.07.23
//
//  Created by Student on 24.07.23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    var coordinator: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func showGreeting(_ sender: Any) {
        coordinator?.showGreeting()
    }
}

