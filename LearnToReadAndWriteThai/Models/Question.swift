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
        case findTheCharacter = 2
    }
    
    //MARK: - Variables
    typealias Identifier = Int
    let identifier: Identifier
    let type : QuestionType
    let level : Level.Identifier
    let characters : String?
    let media : Media?
    let answers : [Answer]
    
    //MARK: - Life cycle functions
    init(identifier: Question.Identifier, type: QuestionType, level: Level.Identifier, characters: String?, media: Media?, answers: [Answer]) {
        self.identifier = identifier
        self.type = type
        self.level = level
        self.characters = characters
        self.media = media
        self.answers = answers
    }
    
    init(jsonQuestion : JsonQuestion) {
        self.identifier = jsonQuestion.identifier
        self.type = QuestionType.init(rawValue: jsonQuestion.type)!
        self.level = jsonQuestion.level
        self.characters = jsonQuestion.characters
        if let mediaPath = jsonQuestion.mediaUrl, let mediaURL = URL.init(string: mediaPath) {
            //TODO : change type of media when necessary
            self.media = Media.init(type: .sound(mediaURL))
        }else{
            self.media = nil
        }
        self.answers = jsonQuestion.answers.map({ Answer.init(jsonAnswer: $0)})
    }
    
    func getRightAnswers() ->[Answer] {
        return self.answers.filter( {$0.isRight})
    }
}
