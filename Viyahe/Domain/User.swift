//
//  User.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/4/21.
//

import Foundation

protocol User {
    func getID() -> Int
    func getUsername() -> String
    func getAvatarURL() -> URL?
    func getHTMLURLString() -> String
    func getAlias() -> String
    func getUserURLString() -> String
    func getType() -> String
    
    func getFollowers() -> Int?
    func getFollowing() -> Int?
    func getFullName() -> String?
    func getOrganization() -> String?
}
