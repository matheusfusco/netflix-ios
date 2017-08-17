//
//  Feed.swift
//  Netflix-iOS
//
//  Created by Matheus Pacheco Fusco on 14/08/17.
//  Copyright © 2017 Finners. All rights reserved.
//

import Foundation

class Feed {
    let highlight = Movie(id: 1, imgURL: "", title: nil, descr: nil)
    
    let movies : [String : [Movie]] = [
        "continue" : [
            Movie(id: 1, imgURL: "movie url 1", title: "movie title 1", descr: "movie descr 1"),
            Movie(id: 2, imgURL: "movie url 2", title: "movie title 2", descr: "movie descr 2"),
            Movie(id: 8, imgURL: "movie url 8", title: "movie title 8", descr: "movie descr 8")
        ],
        "recent" : [
            Movie(id: 3, imgURL: "movie url 3", title: "movie title 3", descr: "movie descr 3"),
            Movie(id: 4, imgURL: "movie url 4", title: "movie title 4", descr: "movie descr 4"),
            Movie(id: 5, imgURL: "movie url 5", title: "movie title 5", descr: "movie descr 5"),
            Movie(id: 6, imgURL: "movie url 6", title: "movie title 6", descr: "movie descr 6"),
            Movie(id: 7, imgURL: "movie url 7", title: "movie title 7", descr: "movie descr 7")
        ]
    ]
}
