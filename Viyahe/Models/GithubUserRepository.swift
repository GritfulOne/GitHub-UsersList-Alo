//
//  GithubUserRepository.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/5/21.
//

import Foundation

final class GithubUserRepository: UserRepository {
    
    //TODO: Get data from database
    func getUsers(users: @escaping ([User]?) -> ()) {
        
        NetworkingWithAlamofire.request("https://api.github.com/users", method: .get, parameters: nil) { (success, data, error) in
            if success, let responseData = data {
                let jsonDecoder = JSONDecoder()
                let githubUsers = try? jsonDecoder.decode([GithubUser].self, from: responseData)
                users(githubUsers)
            } else {
                users(nil)
            }
        }
    }
    
    
    func getFullDetails(forUser user: User, completion: @escaping (User) -> ()) {
        NetworkingWithAlamofire.request(user.getUserURLString(), method: .get, parameters: nil) { (success, data, error) in
            if success, let responseData = data {
                let jsonDecoder = JSONDecoder()
                let githubUserWithFullDetails = try? jsonDecoder.decode(GithubUser.self, from: responseData)
                completion(githubUserWithFullDetails ?? user)
            } else {
                completion(user) //TODO handle negative scenario, return basic info for now
            }
        }
    }
}

//stubbed data
//TODO: parse actual error from api
struct GithubError: Codable {
    private var message: String? = "API rate limit exceeded for xxx.xxx.xxx.xxx. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)"
    private var documentation_url: String? = "https://docs.github.com/rest/overview/resources-in-the-rest-api#rate-limiting"
    
    func getMessage() -> String? {
        return message
    }
    
    func getDocumentationURL() -> String? {
        return documentation_url
    }
}
