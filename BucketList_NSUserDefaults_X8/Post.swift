//
//  Post.swift
//  BucketList_NSUserDefaults_X8
//
//  Created by Saumya Raval on 2/22/17.
//  Copyright © 2017 PlayAgain. All rights reserved.
//

import Foundation
import UIKit

class Post: NSObject, NSCoding {
    
    private var _postImg: String!
    private var _postTitle: String!
    private var _postDesc: String!
    
    var postImg: String {
        return _postImg
    }
    
    var postTitle: String {
        return _postTitle
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    init(img: String, title: String, desc: String) {
        self._postImg = img
        self._postTitle = title
        self._postDesc = desc
    }
    
    override init() {
        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        self._postImg = aDecoder.decodeObject(forKey: "postImg") as? String
        self._postTitle = aDecoder.decodeObject(forKey: "postTitle") as?  String
        self._postDesc = aDecoder.decodeObject(forKey: "postDesc") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._postImg, forKey: "postImg")
        aCoder.encode(self._postTitle, forKey: "postTitle")
        aCoder.encode(self._postDesc, forKey: "postDesc")
    }
    
    

}
