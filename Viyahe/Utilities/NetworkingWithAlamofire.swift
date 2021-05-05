//
//  NetworkingWithAlamofire.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/5/21.
//

import Foundation
import Alamofire

final class NetworkingWithAlamofire: Networking {

    class func request(_ url: String, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Bool, Data?, Error?) -> ()) {
        let httpMethod = Alamofire.HTTPMethod(rawValue: method.rawValue)
        
        AF.request(url, method: httpMethod, parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(_):
                    completion(true, response.data, nil)
                case .failure(let error):
                    completion(false, nil, error)
                }
            }
    }
}
