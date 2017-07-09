//
//  User.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class User: Decodable {
    //MARK: - Variables
    typealias Identifier = Int
    let identifier : User.Identifier
    let name : String
    let finishedLevelIds : [Level.Identifier]
    
    //MARK: - Life cycle functions
    init(identifier: User.Identifier, name: String, finishedLevelIds : [Level.Identifier] = []) {
        self.identifier = identifier
        self.name = name
        self.finishedLevelIds = finishedLevelIds
    }
}
