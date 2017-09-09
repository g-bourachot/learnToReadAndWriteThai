//
//  QuestionViewController.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 02/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import UIKit

protocol QuestionViewControllerDelegate : class {
    func didValidateQuestion(isRight: Bool)
}

class QuestionViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - Variables
    var presentedQuestion: Question!
    weak var delegate: QuestionViewControllerDelegate?
    
    //MARK: - Variables
    private var dataSource : AnswersCollectionViewDataSource = AnswersCollectionViewDataSource()
    private var showCorrection : Bool = false
    private var selectedAnswers: [Answer] = []
    
    //MARK: - IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: - View controller functions
    func setUp(question: Question, score: Int, numberOfQuestion: Int) {
        self.scoreLabel.text = "\(score) / \(numberOfQuestion)"
        self.selectedAnswers.removeAll()
        self.presentedQuestion = question
        self.dataSource.question = presentedQuestion
        self.dataSource.refresh()
        self.display(question: self.presentedQuestion)
    }
    
    private func display(question : Question) {
        switch question.type {
        case .findTheCharacter:
            self.questionLabel.text = presentedQuestion.characters
        default:
            break
        }
        self.collectionView?.reloadData()
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = self.dataSource.itemAtIndex(index: indexPath.row)
        
        switch cellModel {
        case .noResult:
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "AnswersNoResultCell", for: indexPath) as! AnswersNoResultCell
            return cell
        case .result(let answer):
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "AnswersCollectionViewCell", for: indexPath) as! AnswersCollectionViewCell
            cell.setUpCell(with: answer)
            return cell
        }
    }
    
    //MARK: Life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.display(question: self.presentedQuestion)
    }
    
    //MARK: - IBAction
    @IBAction func validateAction(_ sender: UIButton) {
        if selectedAnswers == self.presentedQuestion.getRightAnswers() {
            self.delegate?.didValidateQuestion(isRight: true)
        } else {
            self.delegate?.didValidateQuestion(isRight: false)
        }
    }
    
    //MARK: - AnswersCollectionViewDataSourceDelegate
    func didRefresh() {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    func errorOccured(error: Error) {
        print(error)
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellModel = self.dataSource.itemAtIndex(index: indexPath.row)
        switch cellModel {
        case .result(let answer):
            let cell = self.collectionView.cellForItem(at: indexPath) as! AnswersCollectionViewCell
            cell.toggleState()
            switch cell.state {
            case .selected :
                self.selectedAnswers.append(answer)
            default:
                if let index =  self.selectedAnswers.index(where: { $0.identifier == answer.identifier}) {
                    self.selectedAnswers.remove(at: index)
                }
            }
        default:
            break
        }
    }
}
