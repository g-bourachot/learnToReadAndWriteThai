//
//  JsonQuestion.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 23/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct JsonQuestion : Decodable {
    typealias Identifier = Int
    let identifier: Identifier
    let type : Int
    let level : Level.Identifier
    let characters : String?
    let mediaUrl : String?
}
