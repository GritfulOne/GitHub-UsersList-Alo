//
//  Networking.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/5/21.
//

import Foundation

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

typealias Parameters = [String: Any]
typealias Headers = [String: Any]

protocol Networking: AnyObject {
    static func request(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        completion: @escaping  (Bool, Data?, Error?) -> ())
}
