//
//  UserRepository.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/4/21.
//

import Foundation

protocol UserRepository: AnyObject {
    func getUsers(users: @escaping ([User]?) -> ())
    func getFullDetails(forUser user: User, completion: @escaping (User) -> ())
}
