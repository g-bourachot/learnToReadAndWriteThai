//
//  QuizzScoreViewController.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 16/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation
import UIKit

protocol QuizzScoreViewControllerDelegate : class {
    func closeScoreViewController()
}

class QuizzScoreViewController : UIViewController, UITableViewDataSource {
    
    //MARK: - IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    private var dataSource = QuizzScoreTableViewDataSource()
    weak var delegate: QuizzScoreViewControllerDelegate? = nil
    var finishedQuizz : Quizz!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.setUp(with: self.finishedQuizz)
        self.scoreLabel.text = "\(self.finishedQuizz.currentScore) / \(self.finishedQuizz.questions.count)"
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "QuizzScoreTableViewCell") as! QuizzScoreTableViewCell
        let quizzScoreCellModel = self.dataSource.itemAtIndex(index: indexPath.row)
        cell.titleLabel.text = quizzScoreCellModel.name
        if quizzScoreCellModel.isRight {
            cell.rightWrongLabel.text = "JUSTE"
        }else{
            cell.rightWrongLabel.text = "FAUX"
        }
        return cell
    }
    
    //MARK: - IBActions
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.delegate?.closeScoreViewController()
    }
    
}
