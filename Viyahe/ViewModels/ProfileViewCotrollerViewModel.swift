//
//  ProfileViewCotrollerViewModel.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/5/21.
//

import Foundation

final class ProfileViewCotrollerViewModel {
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func getFullDetails(forUser user: User, completion: @escaping (User) -> ()) {
        userRepository.getFullDetails(forUser: user) { user in
            completion(user)
        }
    }
}
