//
//  DataManager.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 09/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class DataManager {
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
    
    static func getLevels(completionHandler: @escaping ([Level], Error?) -> Void) {
        if let request = try? RequestBuilder.getLevelsRequest() {
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    let decoder = JSONDecoder()
                    let jsonLevels = try! decoder.decode([JsonLevel].self, from: data)
                    let levels = jsonLevels.map({ Level.init(jsonLevel: $0) })
                    completionHandler(levels,nil)
                }
                if let error = error {
                    completionHandler([], error)
                }
            })
            task.resume()
        }
    }
    
    static func getLevel(with identifier: Level.Identifier, completionHandler: @escaping (Level?, Error?) -> Void) {
        if let request = try? RequestBuilder.getLevelRequest(identifier: identifier) {
            let task = URLSession.shared.dataTask(with: request,
                                                  completionHandler: { (data, response, error) in
                                                    if let data = data {
                                                        let decoder = JSONDecoder()
                                                        let jsonLevel = try! decoder.decode(JsonLevel.self, from: data)
                                                        let level = Level.init(jsonLevel: jsonLevel)
                                                        completionHandler(level,nil)
                                                    }
                                                    if let error = error {
                                                        completionHandler(nil, error)
                                                    }
            })
            task.resume()
        }
    }
    
    
    
}
