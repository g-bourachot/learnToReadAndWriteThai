//
//  QuizzesCollectionViewCell.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 30/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation
import UIKit
class QuizzesLevelCell : UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Functions
    func setUpCell(with level: Level) {
        self.titleLabel.text = level.name
    }
}

class QuizzesLoadingCell : UICollectionViewCell {
    
}

class QuizzesErrorCell : UICollectionViewCell {
    
}

class QuizzesNoResultCell : UICollectionViewCell {
    
}
