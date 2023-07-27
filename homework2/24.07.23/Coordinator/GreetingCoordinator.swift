//
//  NameCoordinator.swift
//  24.07.23
//
//  Created by Student on 24.07.23.
//

import UIKit

class GreetingCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    func start() {
        
    }
    
    init(parentCoordinator: Coordinator,
         navigationController: UINavigationController){
        
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
        childCoordinators = []
    }
    
    func addName(completion: @escaping (String) -> Void){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let nameVC = storyboard.instantiateViewController(withIdentifier: "NameViewController") as! NameViewController
        
        nameVC.nameCompleton = completion
        
        //navigationController.pushViewController(nameVC, animated: true)
        navigationController.present(nameVC, animated: true)
    }
}
