//
//  QuizzesListViewController.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 30/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation
import UIKit

class QuizzesListViewController : UIViewController, UICollectionViewDataSource, QuizzesColectionViewDataSourceDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    private var dataSource : QuizzesColectionViewDataSource = QuizzesColectionViewDataSource()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.delegate = self
        self.dataSource.setState(state: .initial)
        self.dataSource.refresh()
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "QuizzesCollectionViewCell", for: indexPath) as! QuizzesCollectionViewCell
        //let cellModel = self.dataSource.itemAtIndex(index: indexPath.row)
        //TODO : set the title of the level
        return cell
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
}
