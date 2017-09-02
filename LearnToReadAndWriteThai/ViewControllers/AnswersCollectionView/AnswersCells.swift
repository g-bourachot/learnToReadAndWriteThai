//
//  AnswersCollectionViewCell.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 02/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import UIKit

class AnswersCollectionViewCell: UICollectionViewCell {
    
    enum State {
        case initial
        case selected
        case rightSelected
        case wrongSelected
        case rightNotSelected
    }
    
    var state: State = .initial {
        didSet{
            self.refresh()
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    //MARK: - Functions
    func setUpCell(with answer: Answer) {
        if let characters = answer.characters {
            self.answerLabel.text = characters
        }else {
            self.answerLabel.text = ""
        }
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowOpacity = 1
        self.contentView.layer.shadowOffset = CGSize.zero
        self.contentView.layer.shadowRadius = 10
    }
    
    private func refresh() {
        switch self.state {
        case .initial:
            self.checkImage = nil
        case .selected:
            self.checkImage = nil
        default:
            self.checkImage = nil
        }
    }
    
}

class AnswersLoadingCell : UICollectionViewCell {
    
}

class AnswersErrorCell : UICollectionViewCell {
    
}

class AnswersNoResultCell : UICollectionViewCell {
    
}
