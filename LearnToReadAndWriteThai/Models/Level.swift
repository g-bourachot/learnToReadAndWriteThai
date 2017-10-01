//
//  Level.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class Level {
    
    //MARK: - Declaration of types
    enum Status : Int {
        case done = 0
        case locked = 1
        case accessible = 2
    }
    
    typealias Identifier = Int
    
    //MARK: - Variables
    let id : Identifier
    let name : String
    var score : Int = 0
    private var status: Status
    
    var isAccessible : Bool {
        if case Level.Status.locked = self.status {
            return false
        }
        return true
    }
    
    //MARK: - Life cycle functions
    init(id: Identifier, name: String, status: Status) {
        self.id = id
        self.status = status
        self.name = name
    }
    
    init(jsonLevel : JsonLevel) {
        self.id = jsonLevel.identifier
        self.name = jsonLevel.name
        self.status = Status(rawValue: jsonLevel.status)!
        if let score = jsonLevel.score {
            self.score = score
        }
    }
    
    //MARK: - Functions
    func setStatus(to status: Status){
        self.status = status
    }
    
    func getJsonLevel() -> JsonLevel {
        return JsonLevel(identifier: self.id, name: self.name, score: self.score, status: self.status.rawValue)
    }
    
}
