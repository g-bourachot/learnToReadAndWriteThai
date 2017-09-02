//
//  QuestionViewController.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 02/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import UIKit

protocol QuestionViewControllerDelegate : class {
    func didValidateQuestion()
}

class QuestionViewController : UIViewController {
    
    //MARK: - Variables
    var presentedQuestion: Question!
    weak var delegate: QuestionViewControllerDelegate?
    
    //MARK: - IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var validateButton: UIButton!
    
    //MARK: - View controller functions
    func setUp(question: Question) {
        self.presentedQuestion = question
        self.display(question: self.presentedQuestion)
    }
    
    private func display(question : Question) {
        switch question.type {
        case .findTheCharacter:
            self.questionLabel.text = presentedQuestion.characters
        default:
            break
        }
    }
    
    //MARK: Life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.display(question: self.presentedQuestion)
    }
    
    //MARK: - IBAction
    @IBAction func validateAction(_ sender: UIButton) {
        self.delegate?.didValidateQuestion()
    }
}
