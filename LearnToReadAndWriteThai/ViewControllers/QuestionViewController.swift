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

class QuestionViewController : UIViewController, UICollectionViewDataSource {
    
    //MARK: - Variables
    var presentedQuestion: Question!
    weak var delegate: QuestionViewControllerDelegate?
    
    //MARK: - Variables
    private var dataSource : AnswersCollectionViewDataSource = AnswersCollectionViewDataSource()
    
    //MARK: - IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.question = presentedQuestion
        self.dataSource.refresh()
    }
    
    //MARK: - View controller functions
    func setUp(question: Question) {
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
        self.delegate?.didValidateQuestion()
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
}
