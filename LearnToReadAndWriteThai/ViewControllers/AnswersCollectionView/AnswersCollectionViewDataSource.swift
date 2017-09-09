//
//  AnswersCollectionViewDataSource.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 02/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import UIKit

class AnswersCollectionViewDataSource {
    enum CellModel {
        case result(Answer)
        case noResult
    }
    
    //MARK: - Variables
    var content : [CellModel] = []
    let numberOfSection = 1
    var question: Question!
    
    //MARK: - Functions
    func refresh(){
        if self.question.answers.count > 0 {
            content = self.question.answers.map(CellModel.result)
        }else {
            content = [CellModel.noResult]
        }
        
    }
    
    func itemAtIndex(index : Int) -> CellModel {
        return self.content[index]
    }
    
    func getSelectedAnswers() -> [Answer] {
        let selectedCells: [CellModel] = []
        for cellModel in self.content {
            if case CellModel.result(let answer) = cellModel {
                answer.isRight
            }
        }
        return []
    }
    
}
