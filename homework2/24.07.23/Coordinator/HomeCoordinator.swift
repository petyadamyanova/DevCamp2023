//
//  HomeCoordinator.swift
//  24.07.23
//
//  Created by Student on 24.07.23.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator{
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(parentCoordinator: Coordinator,
         navigationController: UINavigationController){
        
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
        childCoordinators = []
    }
    
    func start() {
    
    }
    
    func showGreeting() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let greetingVC = storyboard.instantiateViewController(withIdentifier: "GreetingViewController") as! GreetingViewController
        
        let greetingCoordinator = GreetingCoordinator(parentCoordinator: self, navigationController: navigationController)
        
        addChild(child: greetingCoordinator)
        
        greetingVC.coordinator = greetingCoordinator
        
        navigationController.pushViewController(greetingVC, animated: true)
    }
    
}
