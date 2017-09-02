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
        case error
        case loading
    }
    
    //MARK: - Variables
    var content : [CellModel] = []
    let numberOfSection = 1
    var question: Question!
    
    //MARK: - Functions
    func refresh(){
        content = self.question.answers.map(CellModel.result)
    }
    
    func itemAtIndex(index : Int) -> CellModel {
        return self.content[index]
    }
}
