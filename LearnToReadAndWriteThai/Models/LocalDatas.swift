//
//  LocalDatas.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 01/10/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

struct LocalDatas {
    //MARK: - Variables
    static private var finishedLevels : [JsonLevel] = []
    
    //MARK: - Functions
    static func getFinishedLevels() -> [Level] {
        var levels : [Level] = []
        if let savedLevel = UserDefaults.standard.data(forKey: "LocalDatas_levels") {
            if let jsonLevels = try? JSONDecoder().decode([JsonLevel].self, from: savedLevel ) {
                levels = jsonLevels.map( { Level.init(jsonLevel: $0) })
            }
        }
        return levels
    }
    
    static private func getStoredJsonLevels() -> [JsonLevel] {
        var storeJsonLevels : [JsonLevel] = []
        if let savedLevel = UserDefaults.standard.data(forKey: "LocalDatas_levels") {
            if let jsonLevels = try? JSONDecoder().decode([JsonLevel].self, from: savedLevel ) {
                storeJsonLevels = jsonLevels
            }
        }
        return storeJsonLevels
    }
    
    static func save(level : JsonLevel) {
        let jsonEncoder = JSONEncoder()
        var levels = self.getStoredJsonLevels()
        levels.append(level)
        if let savedData = try? jsonEncoder.encode(levels) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "LocalDatas_levels")
        } else {
            print("Failed to save levels.")
        }
    }
}
