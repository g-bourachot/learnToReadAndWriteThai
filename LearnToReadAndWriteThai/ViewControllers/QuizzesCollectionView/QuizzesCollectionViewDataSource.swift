//
//  QuizzesCollectionViewDataSource.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 30/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation

protocol QuizzesCollectionViewDataSourceDelegate {
    func errorOccured(error: Error)
    func didRefresh()
}

class QuizzesCollectionViewDataSource {
    
    enum State {
        case initial
        case loaded([Level])
        case loading
        case error
    }
    enum CellModel {
        case result(Level)
        case noResult
        case error
        case loading
    }
    
    //MARK: - Variables
    var content : [CellModel] = []
    var delegate: QuizzesCollectionViewDataSourceDelegate?
    let numberOfSection = 1
    
    //MARK: - Functions
    func setState(state : State) {
        switch state {
        case .initial:
            content = []
        case .loaded(let levels):
            content = levels.map(CellModel.result)
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
        DataManager.getLevels(completionHandler: { (levels: [Level], error: Error?) in
            if let error = error {
                self.delegate?.errorOccured(error: error)
            }else {
                self.setState(state: .loaded(levels))
                self.delegate?.didRefresh()
            }
        })
    }
}
