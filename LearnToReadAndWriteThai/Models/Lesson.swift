//
//  Lesson.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 13/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class Lesson {
    
    //MARK: - Declaration of types
    enum Status {
        case read
        case locked
        case accessible
    }
    
    typealias Identifier = Int
    
    //MARK: - Variables
    let id : Identifier
    let name : String
    let content : String
    private var status: Status
    
    var isAccessible : Bool {
        if case Lesson.Status.locked = self.status {
            return false
        }
        return true
    }
    
    //MARK: - Life cycle functions
    init(id: Identifier, name: String, content:String, status: Status) {
        self.id = id
        self.name = name
        self.content = content
        self.status = status
    }
    
    init(jsonLesson : JsonLesson) {
        self.id = jsonLesson.identifier
        self.name = jsonLesson.name
        self.content = jsonLesson.content
        switch jsonLesson.status {
        case 0:
            self.status = .accessible
        case 1:
            self.status = .locked
        case 2:
            self.status = .read
        default:
            self.status = .locked
        }
    }
    
    //MARK: - Functions
    func setStatus(to status: Status){
        self.status = status
    }
    
}
