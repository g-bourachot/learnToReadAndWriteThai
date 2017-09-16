//
//  QuizzViewController.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 02/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import UIKit
protocol QuizzViewControllerDelegate : class {
    func quizzIsFinished(quizz: Quizz)
}

class QuizzViewController : UIViewController, QuestionViewControllerDelegate {

    weak var delegate : QuizzViewControllerDelegate? = nil
    var presentedQuizz : Quizz!
    private var presentedQuestionViewController: QuestionViewController? = nil
    private var questionIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        precondition(presentedQuizz != nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        switch presentedQuizz.state {
        case .begin, .running:
            let questionViewController = self.storyboard!.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            questionViewController.presentedQuestion = presentedQuizz.questions[self.questionIndex]
            questionViewController.delegate = self
            self.presentedQuestionViewController = questionViewController
            self.add(asChildViewController: questionViewController)
            self.presentedQuestionViewController?.setUp(question: presentedQuizz.questions[questionIndex])
            self.presentedQuestionViewController?.scoreLabel.text = "\(self.presentedQuizz.currentScore) / \(self.presentedQuizz.questions.count)"
        case .finished:
            break
        }
        
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }

    //MARK: - QuestionViewControllerDelegate
    func didValidateQuestion(isRight: Bool) {
        if isRight {
            self.presentedQuizz.currentScore += 1
            self.presentedQuestionViewController?.scoreLabel.text = "\(self.presentedQuizz.currentScore) / \(self.presentedQuizz.questions.count)"
            self.presentedQuizz.questions[questionIndex].isAnsweredRight = true
        }else {
            self.presentedQuizz.questions[questionIndex].isAnsweredRight = false
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < presentedQuizz.questions.count {
            self.presentedQuestionViewController?.setUp(question: presentedQuizz.questions[questionIndex])
        }else {
            self.delegate?.quizzIsFinished(quizz: self.presentedQuizz)
        }
    }
    
}
