//
//  Level.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class Level {
    
    typealias Identifier = Int
    
    let id : Identifier
    let questions : [Question]
    let score : Int = 0
    
    init(id: Identifier, questions: [Question]) {
        self.id = id
        self.questions = questions
    }
}
