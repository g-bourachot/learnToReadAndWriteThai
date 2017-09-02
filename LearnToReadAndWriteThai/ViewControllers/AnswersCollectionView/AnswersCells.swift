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
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Functions
    func setUpCell(with answer: Answer) {
        if let characters = answer.characters {
            self.answerLabel.text = characters
        }else {
            self.answerLabel.text = ""
        }
        self.state = .initial
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowOpacity = 1
        self.contentView.layer.shadowOffset = CGSize.zero
        self.contentView.layer.shadowRadius = 10
    }
    
    func toggleState(){
        if case .initial = self.state {
            self.state = .selected
            
        } else if case .selected = self.state {
            self.state = .initial
        }
    }
    
    private func refresh() {
        switch self.state {
        case .initial:
            self.checkImage.image = nil
        case .selected:
            self.checkImage.image = UIImage.init(named: "check")
        default:
            break
        }
    }
    
}

class AnswersNoResultCell : UICollectionViewCell {
    
}
