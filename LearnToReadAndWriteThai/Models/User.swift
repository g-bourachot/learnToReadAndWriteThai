//
//  User.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class User {
    //MARK: - Variables
    let name : String
    let finishedLevelIds : [Level.Identifier]
    
    //MARK: - Life cycle functions
    init(name: String, finishedLevelIds : [Level.Identifier]) {
        self.name = name
        self.finishedLevelIds = finishedLevelIds
    }
}
