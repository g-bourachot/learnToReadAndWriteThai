//
//  Media.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class Media {
    
    //MARK: - Declaration of types
    enum MediaType {
        case sound(URL)
        case image(URL)
        case character(String)
    }
    
    //MARK: - Variables
    let type : MediaType
    
    //MARK: - Life cycle functions
    init(type : MediaType) {
        self.type = type
    }
}
