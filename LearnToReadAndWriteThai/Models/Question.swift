//
//  Question.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct Question : Decodable {
    //MARK: - Declaration of types
    enum QuestionType: Int, Decodable {
        case soundToCharacter = 0
        case characterToSound = 1
        case findTheCharacter = 2
    }
    
    //MARK: - CodingKeys declaration
    enum CodingKeys : String, CodingKey {
        case identifier = "identifier"
        case type = "type"
        case level = "level"
        case characters = "characters"
        case mediaUrl = "mediaUrl"
        case answers = "answers"
    }
    
    //MARK: - Variables
    typealias Identifier = Int
    let identifier: Identifier
    let type : QuestionType
    let level : Level.Identifier
    let characters : String?
    let media : Media?
    let answers : [Answer]
    var isAnsweredRight : Bool?
    
    //MARK: - Life cycle functions
    init(identifier: Question.Identifier, type: QuestionType, level: Level.Identifier, characters: String?, media: Media?, answers: [Answer]) {
        self.identifier = identifier
        self.type = type
        self.level = level
        self.characters = characters
        self.media = media
        self.answers = answers
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(Int.self, forKey: .identifier)
        let questionType = try container.decode(Int.self, forKey: .type)
        self.type = QuestionType.init(rawValue: questionType)!
        self.level = try container.decode(Int.self, forKey: .level)
        self.characters = try container.decodeIfPresent(String.self, forKey: .characters)
        self.answers = try container.decode([Answer].self, forKey: .answers)
        if let mediaPath = try container.decodeIfPresent(String.self, forKey: .mediaUrl), let mediaURL = URL.init(string: mediaPath) {
            self.media = Media.init(type: .sound(mediaURL))
        } else {
            self.media = nil
        }
        
    }
    
    func getRightAnswers() ->[Answer] {
        return self.answers.filter( {$0.isRight})
    }
}
