//
//  FeedMovieTableViewCell.swift
//  Netflix-iOS
//
//  Created by Matheus Pacheco Fusco on 15/08/17.
//  Copyright © 2017 Finners. All rights reserved.
//

import UIKit
import SnapKit

class FeedMovieTableViewCell: UITableViewCell {

    let collectionMovieView: CollectionMovieView = CollectionMovieView()
    var movies : [Movie]? {
        didSet {
            collectionMovieView.movies = movies
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(self.collectionMovieView.collectionView)
    }
    
    private func setupConstraints() {
        self.collectionMovieView.collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
