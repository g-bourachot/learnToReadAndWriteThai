//
//  ModelManager.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 09/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class ModelManager {
    static func getUser(with identifier: User.Identifier, completionHandler: @escaping (User?, Error?) -> Void) {
        if let request = try? RequestBuilder.getUserRequest(identifier: identifier) {
            let task = URLSession.shared.dataTask(with: request,
                                        completionHandler: { (data, response, error) in
                                            if let data = data {
                                                let decoder = JSONDecoder()
                                                let user = try! decoder.decode(User.self, from: data)
                                                completionHandler(user,nil)
                                            }
                                            if let error = error {
                                                completionHandler(nil, error)
                                            }
            })
            task.resume()
        }
    }
}
