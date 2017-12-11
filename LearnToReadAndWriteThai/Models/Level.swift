//
//  Level.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct Level : Codable {
    
    //MARK: - CodingKeys declaration
    enum CodingKeys : String, CodingKey {
        case id = "identifier"
        case name = "name"
        case status = "status"
        case score = "score"
    }
    
    //MARK: - Declaration of types
    enum Status : Int, Codable {
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
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        if let score = try container.decodeIfPresent(Int.self, forKey: .score) {
            self.score = score
        }
        self.status = try container.decode(Level.Status.self, forKey: .status)
    }
    
    //MARK: - Functions
    mutating func setStatus(to status: Status){
        self.status = status
    }
    
}
