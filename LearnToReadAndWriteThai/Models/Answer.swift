//
//  Answer.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class Answer {
    //MARK: - Variables
    let isRight: Bool
    let media : Media
        
    //MARK: - Life cycle functions
    init(media : Media, isRight: Bool) {
        self.media = media
        self.isRight = isRight
    }
    
}
