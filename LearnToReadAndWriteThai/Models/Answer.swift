//
//  Answer.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct Answer {
    //MARK: - Variables
    let isRight: Bool
    let characters : String?
    let mediaUrl : String?
        
    //MARK: - Life cycle functions
    init(mediaUrl : String?, isRight: Bool, characters: String?) {
        self.mediaUrl = mediaUrl
        self.isRight = isRight
        self.characters = characters
    }
    
    init(jsonAnswer: JsonAnswer) {
        self.mediaUrl = jsonAnswer.mediaUrl
        self.isRight = (jsonAnswer.isRight == 1)
        self.characters = jsonAnswer.characters
    }
    
}
