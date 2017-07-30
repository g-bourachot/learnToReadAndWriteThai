//
//  JsonAnswer.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 30/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct JsonAnswer : Decodable {
    typealias Identifier = Int
    let identifier: Identifier
    let questionId : Int
    let characters : String?
    let mediaUrl : String?
    let isRight : Int
}
