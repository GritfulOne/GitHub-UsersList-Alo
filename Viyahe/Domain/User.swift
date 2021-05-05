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
    func getName() -> String
}
