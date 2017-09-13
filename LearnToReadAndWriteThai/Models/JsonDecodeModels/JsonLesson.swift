//
//  JsonLesson.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 13/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct JsonLesson : Decodable{
    //MARK: - Variables
    typealias Identifier = Int
    let identifier : JsonLesson.Identifier
    let name : String
    let content: String
    let status : Int
}
