//
//  DataManager.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 09/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class DataManager {
    static private let decoder = JSONDecoder()
    
    static func getUser(with identifier: User.Identifier, completionHandler: @escaping (User?, Error?) -> Void) {
        if let request = try? RequestBuilder.getUserRequest(identifier: identifier) {
            let task = URLSession.shared.dataTask(with: request,
                                        completionHandler: { (data, response, error) in
                                            if let data = data {
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
                    let levels = try! decoder.decode([Level].self, from: data)
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
                                                        let level = try! decoder.decode(Level.self, from: data)
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
                    let questions = try! decoder.decode([Question].self, from: data)
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
                    let answers = try! decoder.decode([Answer].self, from: data)
                    completionHandler(answers,nil)
                }
                if let error = error {
                    completionHandler([], error)
                }
            })
            task.resume()
        }
    }
    
    static func getLessons(completionHandler: @escaping ([Lesson], Error?) -> Void) {
        if let request = try? RequestBuilder.getLessonsRequest() {
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data {
                    let lessons = try! decoder.decode([Lesson].self, from: data)
                    completionHandler(lessons,nil)
                }
                if let error = error {
                    completionHandler([], error)
                }
            })
            task.resume()
        }
    }
    
    static func getLesson(with identifier: Lesson.Identifier, completionHandler: @escaping (Lesson?, Error?) -> Void) {
        if let request = try? RequestBuilder.getLessonRequest(identifier: identifier) {
            let task = URLSession.shared.dataTask(with: request,
                                                  completionHandler: { (data, response, error) in
                                                    if let data = data {
                                                        let lesson = try! decoder.decode(Lesson.self, from: data)
                                                        completionHandler(lesson,nil)
                                                    }
                                                    if let error = error {
                                                        completionHandler(nil, error)
                                                    }
            })
            task.resume()
        }
    }
    
}
