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
    
    var isRight: Bool = false
    
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
        self.isRight = answer.isRight
        self.containerView.layer.shadowColor = UIColor.black.cgColor
        self.containerView.layer.shadowOpacity = 1
        self.containerView.layer.shadowOffset = CGSize.zero
        self.containerView.layer.shadowRadius = 3
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
            self.containerView.backgroundColor = UIColor.white
        case .selected:
            self.checkImage.image = nil
            self.containerView.backgroundColor = UIColor.gray
        case .rightSelected:
            self.checkImage.image = UIImage.init(named: "check")
            self.containerView.backgroundColor = UIColor.green
        case .rightNotSelected:
            self.containerView.backgroundColor = UIColor.white
            self.checkImage.image = UIImage.init(named: "check")
        case .wrongSelected:
            self.checkImage.image = nil
            self.containerView.backgroundColor = UIColor.red
        }
    }
    
}

class AnswersNoResultCell : UICollectionViewCell {
    
}
