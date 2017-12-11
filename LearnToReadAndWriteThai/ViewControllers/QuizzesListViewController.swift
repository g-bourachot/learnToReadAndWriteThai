//
//  QuizzesListViewController.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 30/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation
import UIKit

class QuizzesListViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, QuizzesCollectionViewDataSourceDelegate, QuizzViewControllerDelegate, QuizzScoreViewControllerDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    private var dataSource : QuizzesCollectionViewDataSource = QuizzesCollectionViewDataSource()
    private var runningLevel : Level? = nil
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.delegate = self
        self.dataSource.setState(state: .initial)
        self.dataSource.refresh()
    }
    
    //MARK: - Functions
    func presentScoreViewController(with quizz:Quizz) {
        let quizzScoreViewController = self.storyboard!.instantiateViewController(withIdentifier: "QuizzScoreViewController") as! QuizzScoreViewController
        quizzScoreViewController.finishedQuizz = quizz
        quizzScoreViewController.delegate = self
        self.present(quizzScoreViewController, animated: true, completion: nil)
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = self.dataSource.itemAtIndex(index: indexPath.row)
        
        switch cellModel {
        case .loading:
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "QuizzesLoadingCell", for: indexPath) as! QuizzesLoadingCell
            return cell
        case .error:
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "QuizzesErrorCell", for: indexPath) as! QuizzesErrorCell
            return cell
        case .noResult:
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "QuizzesNoResultCell", for: indexPath) as! QuizzesNoResultCell
            return cell
        case .result(let level):
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "QuizzesLevelCell", for: indexPath) as! QuizzesLevelCell
            cell.setUpCell(with: level)
            return cell
        }
    }
    
    //MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellModel = self.dataSource.itemAtIndex(index: indexPath.row)
        
        switch cellModel {
        case .result(let level):
            //TODO: Print Loading spinning
            self.runningLevel = level
            let quizzGenerator = QuizzGenerator(level: level, numberOfQuestion: 10)
            quizzGenerator.generate(completionHandler: { (generatedQuizz, error) in
                //TODO: Stop spinning
                if error != nil {
                    //TODO: Present error
                }
                
                if let quizz = generatedQuizz {
                    let quizzViewController = self.storyboard!.instantiateViewController(withIdentifier: "QuizzViewController") as! QuizzViewController
                    quizzViewController.presentedQuizz = quizz
                    quizzViewController.delegate = self
                    self.present(quizzViewController, animated: true, completion: nil)
                }                
            })
        default:
            break
        }
    }
    
    //MARK: - QuizzesColectionViewDataSourceDelegate
    func didRefresh() {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    func errorOccured(error: Error) {
        print(error)
    }
    
    //MARK: - QuizzViewControllerDelegate
    func quizzIsFinished(quizz: Quizz) {
        if var runningLevel = self.runningLevel {
            runningLevel.score = quizz.currentScore
            LocalDatas.save(level: runningLevel)
            self.runningLevel = nil
        }
        self.dismiss(animated: true, completion: nil)
        self.presentScoreViewController(with: quizz)
    }
    
    //MARK: - QuizzScoreViewControllerDelegate
    func closeScoreViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}
