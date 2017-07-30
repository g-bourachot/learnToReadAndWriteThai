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
    
    static func getQuestions(for level: Level.Identifier, limit: Int = 20, completionHandler: @escaping ([Question], Error?) -> Void) {
        if let request = try? RequestBuilder.getQuestionsRequest(for: level, limit: limit){
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    let decoder = JSONDecoder()
                    let jsonQuestions = try! decoder.decode([JsonQuestion].self, from: data)
                    let questions = jsonQuestions.map({Question.init(jsonQuestion: $0)})
                    completionHandler(questions,nil)
                }
                if let error = error {
                    completionHandler([], error)
                }
            })
            task.resume()
        }
    }
    
    static func getAnswers(for question: Question, completionHandler: @escaping ([Answer], Error?) -> Void) {
        if let request = try? RequestBuilder.getAnswerRequest(for: question) {
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    let decoder = JSONDecoder()
                    let jsonAnswers = try! decoder.decode([JsonAnswer].self, from: data)
                    let answers = jsonAnswers.map({Answer.init(jsonAnswer: $0)})
                    completionHandler(answers,nil)
                }
                if let error = error {
                    completionHandler([], error)
                }
            })
            task.resume()
        }
    }
    
}
