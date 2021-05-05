//
//  MainTableViewViewModel.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/5/21.
//

import Foundation

final class MainTableViewViewModel {
    weak private var appCoordinator: AppCoordinator?
    let userRepository: UserRepository
    
    
    init(appCoordinator: AppCoordinator, userRepository: UserRepository) {
        self.appCoordinator = appCoordinator
        self.userRepository = userRepository
    }
    
    
    func getUsers(completion: @escaping (Bool, [User]?) -> ()) {
        userRepository.getUsers() { (users) in
            
            if  let users = users {
                completion(true, users.sorted(by: { $0.getID() < $1.getID() }))
            } else {
                completion(false, nil) //TODO: verify the error is because of rate limiting
            }
        }
    }
    
    func showProfilePage(forUser user: User) {
        appCoordinator?.showProfilePage(forUser: user)
    }
    
    
    func showErrorAlert() {
        let error = GithubError()
        let message = error.getMessage()! + "\n\n" + error.getDocumentationURL()!
        appCoordinator?.showAlert(message: message)
    }
}
