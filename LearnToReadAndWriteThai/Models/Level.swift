//
//  Level.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class Level {
    
    //MARK: - Declaration of types
    enum Status {
        case done(maxScore: Int)
        case locked
        case accessible
    }
    
    typealias Identifier = String
    
    //MARK: - Variables
    let id : Identifier
    let questions : [Question]
    let score : Int = 0
    private var status: Status
    
    var isAccessible : Bool {
        if case Level.Status.locked = self.status {
            return false
        }
        return true
    }
    
    //MARK: - Life cycle functions
    init(id: Identifier, questions: [Question], status: Status) {
        self.id = id
        self.questions = questions
        self.status = status
    }
    
    //MARK: - Functions
    func setStatus(to status: Status){
        self.status = status
    }
    
}
