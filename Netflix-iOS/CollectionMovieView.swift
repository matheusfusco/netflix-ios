//
//  CollectionMovieView.swift
//  Netflix-iOS
//
//  Created by Matheus Pacheco Fusco on 14/08/17.
//  Copyright © 2017 Finners. All rights reserved.
//

import UIKit

class CollectionMovieView: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: - Lets and Vars
    let collectionID = "collectionID"
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cl = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cl.backgroundColor = .green
        cl.delegate = self
        cl.dataSource = self
        return cl
    }()
    var movies : [Movie]?
    
    //MARK: - Life Cycle
    override init() {
        super.init()
        collectionView.register(ContinueWatchingCollectionViewCell.self, forCellWithReuseIdentifier: self.collectionID)
    }
    
    //MARK: - Delegate & DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collectionID, for: indexPath) as! ContinueWatchingCollectionViewCell
        
        cell.backgroundColor = .yellow
        cell.movie = self.movies?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width * 0.6
        let height: CGFloat = width * (3/4)
        return CGSize(width: width, height: height)
    }
}
