//
//  ViewController.swift
//  LearnToReadAndWriteThai
//
//  Created by Guillaume Bourachot on 06/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let questions = DataManager.getQuestions(for: 1, limit: 10, completionHandler: { (questions: [Question], error: Error?) in
            if error != nil {
                print(error)
            }else {
                print(questions)
            }
        })
        /*
        let question = Question.init(identifier: 5, type: .findTheCharacter, level: 1, characters: "o", mediaUrl: nil)
        let answers = DataManager.getAnswers(for: question, completionHandler: { (answers: [Answer], error: Error?) in
            if error != nil {
                print(error)
            }else {
                print(answers)
            }
        }) */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

