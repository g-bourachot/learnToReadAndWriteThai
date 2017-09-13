//
//  LessonsCells.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 13/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation
import UIKit
class LessonsCell : UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Functions
    func setUpCell(with lesson: Lesson) {
        self.titleLabel.text = lesson.name
    }
}

class LessonsLoadingCell : UICollectionViewCell {
    
}

class LessonsErrorCell : UICollectionViewCell {
    
}

class LessonsNoResultCell : UICollectionViewCell {
    
}
