//
//  Question.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class Question {
    //MARK: - Declaration of types
    enum QuestionType {
        case soundToCharacter
        case characterToSound
        case findTheCharacterClass
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
