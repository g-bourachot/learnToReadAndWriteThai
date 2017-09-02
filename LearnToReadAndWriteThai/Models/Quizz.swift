//
//  Quizz.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 02/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct Quizz {
    
    enum State {
        case begin
        case running
        case finished
    }
    
    let questions: [Question]
    var currentScore: Int
    var state : State
}

struct QuizzGenerator {
    
    let level : Level
    let numberOfQuestion : Int
    
    func generate(completionHandler: @escaping (Quizz?, Error?) -> Void){
        DataManager.getQuestions(for: self.level.id, limit: numberOfQuestion, completionHandler: { (questions, error) in
            if let generatedError = error {
                completionHandler(nil,generatedError)
            }else {
                let quizz = Quizz(questions: questions, currentScore: 0, state: .begin)
                completionHandler(quizz,nil)
            }
        })
    }
}
