//
//  QuizzScoreTableViewDataSource.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 16/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

class QuizzScoreTableViewDataSource {
    
    //MARK: - Enum & Structures
    struct QuizzScoreCellModel {
        let name: String
        let isRight: Bool
    }
    
    //MARK: - Variables
    var content:[QuizzScoreCellModel] = []
    
    //MARK: - Functions
    func setUp(with quizz:Quizz){
        self.content = quizz.questions.map( { QuizzScoreCellModel.init(name: $0.characters!, isRight: $0.isAnsweredRight ?? false) })
    }
    
    func itemAtIndex(index : Int) -> QuizzScoreCellModel {
        return self.content[index]
    }
    
}
