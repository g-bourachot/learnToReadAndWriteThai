//
//  LessonsCollectionViewDataSource.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 13/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

protocol LessonsCollectionViewDataSourceDelegate {
    func errorOccured(error: Error)
    func didRefresh()
}

class LessonsCollectionViewDataSource {
    
    //MARK: - Struct & Enums
    enum State {
        case initial
        case loaded([Lesson])
        case loading
        case error
    }
    enum CellModel {
        case result(Lesson)
        case noResult
        case error
        case loading
    }
    
    //MARK: - Variables
    var content : [CellModel] = []
    var delegate: LessonsCollectionViewDataSourceDelegate?
    let numberOfSection = 1
    
    //MARK: - Functions
    func setState(state : State) {
        switch state {
        case .initial:
            content = []
        case .loaded(let lessons):
            content = lessons.map(CellModel.result)
        case .loading:
            content = [.loading]
        case .error:
            content = [.error]
        }
    }
    
    func itemAtIndex(index : Int) -> CellModel {
        return self.content[index]
    }
    
    func refresh() {
        self.setState(state: .loading)
        DataManager.getLessons(completionHandler: { (lessons: [Lesson], error: Error?) in
            if let error = error {
                self.delegate?.errorOccured(error: error)
            }else {
                self.setState(state: .loaded(lessons))
                self.delegate?.didRefresh()
            }
        })
    }
}
