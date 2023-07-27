//
//  AppCoordinator.swift
//  24.07.23
//
//  Created by Student on 24.07.23.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
        childCoordinators = []
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as!  ProfileViewController
        
        configureTabBar(viewControllers: [homeVC, profileVC])
        
        let homeCoordinator = HomeCoordinator(parentCoordinator: self, navigationController: navigationController)
        let profileCoordinator = ProfileCoordinator(parentCoordinator: self, navigationController: navigationController)
    
        addChildren(children: [homeCoordinator, profileCoordinator])
        
        homeVC.coordinator = homeCoordinator
        profileVC.coordinator = profileCoordinator
        
        childCoordinators.forEach{
            $0.start()
        }
        
    }
    
    func configureTabBar(viewControllers: [UIViewController]){
        let tabBarController = UITabBarController()
        tabBarController.delegate = self
        
        for controller in viewControllers {
            let tabBarItem: UITabBarItem
            
            switch controller{
            case is HomeViewController:
                tabBarItem = UITabBarItem(title : "Home", image: UIImage(systemName: "house") , tag: 0)
            case is ProfileViewController:
                tabBarItem = UITabBarItem(title : "Profile", image: UIImage(systemName: "person") , tag: 0)
            default:
                tabBarItem = UITabBarItem()
            }
            
            controller.tabBarItem = tabBarItem
        }
        
        tabBarController.viewControllers = viewControllers
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: UITabBarControllerDelegate{
    func tabBarController(_: UITabBarController, didSelect viewController: UIViewController) {
            switch viewController {
            case is HomeViewController:
                navigationController.navigationBar.topItem?.title = "Home"
            case is ProfileViewController:
                navigationController.navigationBar.topItem?.title = "Profile"
            default:
                break
            }
        }
}
