//
//  JsonLevel.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 23/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct JsonLevel : Decodable {
    //MARK: - Variables
    typealias Identifier = Int
    let identifier : JsonLevel.Identifier
    let name : String
    let score: Int?
    let status : Int
}
