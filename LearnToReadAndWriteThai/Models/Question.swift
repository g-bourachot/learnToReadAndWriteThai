//
//  Question.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct Question {
    //MARK: - Declaration of types
    enum QuestionType: Int {
        case soundToCharacter = 0
        case characterToSound = 1
        case findTheCharacterClass = 2
    }
    
    //MARK: - Variables
    let type : QuestionType
    let answers : [Answer]
    
    //MARK: - Life cycle functions
    init(type: QuestionType, answers: [Answer]) {
        self.type = type
        self.answers = answers
    }
    
}
