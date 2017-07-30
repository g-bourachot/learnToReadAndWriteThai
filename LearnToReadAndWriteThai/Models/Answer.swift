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
    let media : Media?
        
    //MARK: - Life cycle functions
    init(media : Media?, isRight: Bool, characters: String?) {
        self.media = media
        self.isRight = isRight
        self.characters = characters
    }
    
    init(jsonAnswer: JsonAnswer) {
        self.isRight = (jsonAnswer.isRight == 1)
        self.characters = jsonAnswer.characters
        if let mediaPath = jsonAnswer.mediaUrl, let mediaURL = URL.init(string: mediaPath) {
            self.media = Media.init(type: .sound(mediaURL))
        }else {
            self.media = nil
        }
    }
    
}
