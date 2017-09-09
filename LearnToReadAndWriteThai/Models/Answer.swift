//
//  Answer.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct Answer: Equatable{
    //MARK: - Variables
    typealias Identifier = Int
    let identifier: Identifier
    let isRight: Bool
    let characters : String?
    let media : Media?
        
    //MARK: - Life cycle functions
    init(identifier: Answer.Identifier, media : Media?, isRight: Bool, characters: String?) {
        self.identifier = identifier
        self.media = media
        self.isRight = isRight
        self.characters = characters
    }
    
    init(jsonAnswer: JsonAnswer) {
        self.identifier = (jsonAnswer.identifier)
        self.isRight = (jsonAnswer.isRight == 1)
        self.characters = jsonAnswer.characters
        if let mediaPath = jsonAnswer.mediaUrl, let mediaURL = URL.init(string: mediaPath) {
            self.media = Media.init(type: .sound(mediaURL))
        }else {
            self.media = nil
        }
    }
    
    //MARK: - Equatable
    static func ==(lhs: Answer, rhs: Answer)->Bool {
        return lhs.identifier == rhs.identifier
    }
    
}
