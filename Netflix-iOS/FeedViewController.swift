//
//  ViewController.swift
//  Netflix-iOS
//
//  Created by Matheus Pacheco Fusco on 07/08/17.
//  Copyright © 2017 Finners. All rights reserved.
//

import UIKit
import SnapKit

class FeedViewController: UITableViewController {

    //MARK: - Lets and Vars
    let progressView : UIActivityIndicatorView = {
       let progress = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        progress.backgroundColor = .black
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.startAnimating()
        return progress
    }()
    let identifier = "cellID"
    
    var feed : Feed?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configVariables()
        self.configViews()
        self.buildViews()
        self.setupContraints()
    }
    
    //MARK: - Custom Methods
    func configVariables() {
        let api = APIManager.shared
        api.delegate = self
        api.request()
    }
    
    func configViews() {
        tableView.register(FeedMovieTableViewCell.self, forCellReuseIdentifier: self.identifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
    }
    
    func buildViews() {
        guard let window = UIApplication.shared.keyWindow else {return}
        window.addSubview(self.progressView)
        window.bringSubview(toFront: progressView)
    }
    
    func setupContraints() {
        guard let window = UIApplication.shared.keyWindow else {return}
        
        self.progressView.snp.makeConstraints { (make) in
            make.leading.equalTo(window.snp.leading)
            make.trailing.equalTo(window.snp.trailing)
            make.top.equalTo(window.snp.top)
            make.bottom.equalTo(window.snp.bottom)
        }
    }
    
    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - UITableView Delegate
extension FeedViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - UITableView DataSource
extension FeedViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.feed?.movies.keys.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! FeedMovieTableViewCell
        cell.backgroundColor = .brown
        if let m = self.feed?.movies {
            let key = Array(m.keys)[indexPath.section]
            let movies = m[key]
            cell.movies = movies
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let movie = self.feed?.movies {
            return Array(movie.keys)[section]
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width: CGFloat = tableView.frame.width * 0.6
        let height: CGFloat = width * (3/4)
        return height
    }
}

//MARK: - APIManager Delegate
extension FeedViewController : FeedDelegate {
    func response(status: Int, feed: Feed) {
        self.progressView.removeFromSuperview()
        if status == 200 {
            self.feed = feed
            tableView.reloadData()
        }
    }
}
