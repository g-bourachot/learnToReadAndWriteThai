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
    enum Status {
        case done
        case locked
        case accessible
    }
    
    typealias Identifier = Int
    
    //MARK: - Variables
    let id : Identifier
    let name : String
    let score : Int = 0
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
        switch jsonLevel.status {
        case 0:
            self.status = .accessible
        case 1:
            self.status = .locked
        case 2:
            self.status = .done
        default:
            self.status = .locked
        }
    }
    
    //MARK: - Functions
    func setStatus(to status: Status){
        self.status = status
    }
    
}
