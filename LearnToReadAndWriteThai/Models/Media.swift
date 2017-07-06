//
//  Media.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class Media {
    
    enum `Type` {
        case sound(URL)
        case image(URL)
        case character(String)
    }
    
    let type : Media.Type
    init(type : Media.Type) {
        self.type = type
    }
}
