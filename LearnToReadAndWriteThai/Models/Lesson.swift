//
//  Lesson.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 13/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct Lesson : Decodable {
    
    //MARK: - CodingKeys declaration
    enum CodingKeys : String, CodingKey {
        case identifier = "identifier"
        case name = "name"
        case content = "content"
        case status = "status"
    }
    
    //MARK: - Declaration of types
    enum Status : Int, Decodable {
        case read = 2
        case locked = 1
        case accessible = 0
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .identifier)
        self.name = try container.decode(String.self, forKey: .name)
        self.content = try container.decode(String.self, forKey: .content)
        self.status = try container.decode(Status.self, forKey: .status)
    }
    
    //MARK: - Functions
    mutating func setStatus(to status: Status){
        self.status = status
    }
    
}
