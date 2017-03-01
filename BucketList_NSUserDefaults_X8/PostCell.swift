//
//  PostCell.swift
//  BucketList_NSUserDefaults_X8
//
//  Created by Saumya Raval on 2/24/17.
//  Copyright © 2017 PlayAgain. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = 5.0
        postImg.clipsToBounds = true
        
    }
    
    func configureCell(post: Post) {
        postTitle.text = post.postTitle
        postDesc.text = post.postDesc
        postImg.image = dataService.instance.getImageForPath(path: post.postImg)
        //postImg.image = UIImage(named: "\(post.postImg)")
    }
}
