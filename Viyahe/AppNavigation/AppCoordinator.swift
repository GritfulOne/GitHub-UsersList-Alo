//
//  BaseCoordinator.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/4/21.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    var window: UIWindow!
    
    func start() {
        //iOS 13 Set
        if #available(iOS 13, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                window = UIWindow(windowScene: windowScene)
            }
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTheme]
        showMainPage()
    }
    
    private func showMainPage() {
        let mainVC = MainTableViewController()
        let viewModel = MainTableViewViewModel(appCoordinator: self, userRepository: GithubUserRepository())
        mainVC.viewModel = viewModel
        navigationController.viewControllers = [mainVC]
    }
    
    
    func showProfilePage(forUser user: User) {
        let profileVC = ProfileViewController()
        profileVC.viewModel = ProfileViewCotrollerViewModel(userRepository: GithubUserRepository())
        profileVC.user = user
        
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    
    func showAlert(message: String?) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        navigationController.present(alertController, animated: true, completion: nil)
    }
}
