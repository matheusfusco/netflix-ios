//
//  APIManager.swift
//  Netflix-iOS
//
//  Created by Matheus Pacheco Fusco on 09/08/17.
//  Copyright © 2017 Finners. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    static let shared = APIManager()
    var delegate : FeedDelegate!
    
    func request() {
        let delay = DispatchTime.now() + .seconds(1)
        
        DispatchQueue.main.asyncAfter(deadline: delay) { 
            self.delegate.response(status: 200, feed: Feed())
        }
    }
}

protocol FeedDelegate {
    func response(status: Int, feed: Feed)
}
