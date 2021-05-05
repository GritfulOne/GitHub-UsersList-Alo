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
    
    func getName() -> String {
        login
    }
}
