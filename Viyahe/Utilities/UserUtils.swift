//
//  UserUtils.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/5/21.
//

import Foundation

final class UserUtils {
    class func getLastID(users: [User]) -> Int {
        return users.sorted{ $0.getID() < $1.getID() }.last?.getID() ?? 0
    }
}
