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
    static private var finishedLevels : [Level] = []
    
    //MARK: - Functions
    static func getFinishedLevels() -> [Level] {
        var levels : [Level] = []
        if let savedLevel = UserDefaults.standard.data(forKey: "LocalDatas_levels") {
            if let decodedLevels = try? JSONDecoder().decode([Level].self, from: savedLevel ) {
                levels = decodedLevels
            }
        }
        return levels
    }
    
    static private func getStoredLevels() -> [Level] {
        var storedLevels : [Level] = []
        if let savedLevel = UserDefaults.standard.data(forKey: "LocalDatas_levels") {
            if let decodedLevels = try? JSONDecoder().decode([Level].self, from: savedLevel ) {
                storedLevels = decodedLevels
            }
        }
        return storedLevels
    }
    
    static func save(level : Level) {
        let jsonEncoder = JSONEncoder()
        var levels = self.getStoredLevels()
        levels.append(level)
        if let savedData = try? jsonEncoder.encode(levels) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "LocalDatas_levels")
        } else {
            print("Failed to save levels.")
        }
    }
}
