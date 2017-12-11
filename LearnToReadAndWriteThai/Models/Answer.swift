//
//  Answer.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct Answer: Equatable, Decodable{
    
    //MARK: - CodingKeys declaration
    enum CodingKeys : String, CodingKey {
        case identifier = "identifier"
        case characters = "characters"
        case mediaUrl = "mediaUrl"
        case isRight = "isRight"
    }
    
    //MARK: - Variables
    typealias Identifier = Int
    let identifier: Identifier
    let isRight: Bool
    let characters : String?
    let media : Media?
        
    //MARK: - Life cycle functions
    init(identifier: Answer.Identifier, media : Media?, isRight: Bool, characters: String?) {
        self.identifier = identifier
        self.media = media
        self.isRight = isRight
        self.characters = characters
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try container.decode(Int.self, forKey: .identifier)
        self.isRight = ( try container.decode(Int.self, forKey: .isRight) == 1)
        if let characters = try container.decodeIfPresent(String.self, forKey: .characters) {
            self.characters = characters
        }else {
            self.characters = nil
        }
        if let mediaPath = try container.decodeIfPresent(String.self, forKey: .mediaUrl), let mediaURL = URL.init(string: mediaPath) {
            self.media = Media.init(type: .sound(mediaURL))
        } else {
            self.media = nil
        }
    }
    
    //MARK: - Equatable
    static func ==(lhs: Answer, rhs: Answer)->Bool {
        return lhs.identifier == rhs.identifier
    }
    
}
