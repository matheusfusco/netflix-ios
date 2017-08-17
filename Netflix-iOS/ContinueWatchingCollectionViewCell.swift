//
//  ContinueWatchingCollectionViewCell.swift
//  Netflix-iOS
//
//  Created by Matheus Pacheco Fusco on 14/08/17.
//  Copyright © 2017 Finners. All rights reserved.
//

import UIKit

class ContinueWatchingCollectionViewCell: UICollectionViewCell {
 
    var movie: Movie? {
        didSet {
            titleLabel.text = movie?.title
        }
    }
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "title"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(self.titleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
    }
}
