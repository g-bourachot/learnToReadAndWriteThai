//
//  Question.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class Question {
    
    enum QuestionType {
        case soundToCharacter
        case characterToSound
        case findTheCharacterClass
    }
    
    let type : QuestionType
    let answers : [Answer]
    
    init(type: QuestionType, answers: [Answer]) {
        self.type = type
        self.answers = answers
    }
    
}
