//
//  RequestBuilder.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 09/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation
class RequestBuilder {
    
    enum Error : Swift.Error {
        case wrongURL
    }
    
    static let baseUrlString = URL(string: "http://mac-de-guillaume.local:8080")
    
    static func getUserRequest(identifier : User.Identifier) throws -> URLRequest{
        if let url = baseUrlString?.appendingPathComponent("/user/\(identifier)") {
            return URLRequest(url: url)
        }
        throw Error.wrongURL
    }
}
