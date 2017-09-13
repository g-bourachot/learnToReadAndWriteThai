//
//  LessonsListViewController.swift
//  LearnToReadAndWriteThai
//
//  Created by Liom on 30/07/2017.
//  Copyright © 2017 Guillaume Bourachot. All rights reserved.
//

import Foundation
import UIKit

class LessonsListViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, LessonsCollectionViewDataSourceDelegate, LessonViewControllerDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    private var dataSource : LessonsCollectionViewDataSource = LessonsCollectionViewDataSource()
    
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
        let cellModel = self.dataSource.itemAtIndex(index: indexPath.row)
        
        switch cellModel {
        case .loading:
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "LessonsLoadingCell", for: indexPath) as! LessonsLoadingCell
            return cell
        case .error:
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "LessonsErrorCell", for: indexPath) as! LessonsErrorCell
            return cell
        case .noResult:
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "LessonsNoResultCell", for: indexPath) as! LessonsNoResultCell
            return cell
        case .result(let lesson):
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "LessonsCell", for: indexPath) as! LessonsCell
            cell.setUpCell(with: lesson)
            return cell
        }
    }
    
    //MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellModel = self.dataSource.itemAtIndex(index: indexPath.row)
        
        switch cellModel {
        case .result(let lesson):
            //TODO: Print Loading spinning
            //TODO: Load lesson and present it
            break
        default:
            break
        }
    }
    
    //MARK: - LessonsColectionViewDataSourceDelegate
    func didRefresh() {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    func errorOccured(error: Error) {
        print(error)
    }
    
    //MARK: - LessonsViewControllerDelegate
    func closeLesson() {
        self.dismiss(animated: true, completion: nil)
    }
}
