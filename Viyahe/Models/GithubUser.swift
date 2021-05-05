//
//  GithubUser.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/4/21.
//

import Foundation

struct GithubUser: User, Codable {
    private let id: Int
    private let login: String
    private let avatar_url: String
    private let html_url: String
    private let type: String
    private let organizations_url: String
    private let followers_url: String
    private let following_url: String
    private let url: String
    
    private let followers: Int?
    private let following: Int?
    private let name: String?
    private let company: String?
    
    func getID() -> Int {
        return id
    }
    
    func getUsername() -> String {
        return "@" + login
    }
        
    func getAvatarURL() -> URL? {
        return URL(string: avatar_url)
    }
    
    func getHTMLURLString() -> String {
        return html_url
    }
    
    func getAlias() -> String {
        login
    }
    
    func getUserURLString() -> String {
        return url
    }
    
    func getType() -> String {
        return type
    }
    
    
    func getFollowers() -> Int? {
        return followers
    }
    
    func getFollowing() -> Int? {
        return following
    }
    
    func getFullName() -> String? {
        return name
    }
    
    func getOrganization() -> String? {
        return company
    }
}
