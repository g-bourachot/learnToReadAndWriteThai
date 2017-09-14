//
//  LessonViewController.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 13/09/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class LessonViewController : UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: - variables
    var htmlContent : String!
    var lessonName: String!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViewController()
    }
    
    //MARK: - Functions
    private func setUpViewController() {
        self.webView.loadHTMLString(self.htmlContent, baseURL: nil)
        self.titleLabel.text = self.lessonName
    }
    
}
