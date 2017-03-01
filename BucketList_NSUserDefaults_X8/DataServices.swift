//
//  DataServices.swift
//  BucketList_NSUserDefaults_X8
//
//  Created by Saumya Raval on 2/27/17.
//  Copyright © 2017 PlayAgain. All rights reserved.
//

import Foundation
import UIKit

class dataService {
    static let instance = dataService()
    
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func loadPosts() {
        if let post = UserDefaults.standard.object(forKey: "postData") as? NSData {
            if let new = NSKeyedUnarchiver.unarchiveObject(with: post as Data) as? [Post] {
                _loadedPosts = new
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        
    }
    
    func savePosts() {
        let post = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.set(post, forKey: "postData")
        UserDefaults.standard.synchronize()
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
        //let newnew = documentsPathForFileName(name: "image.png")
    }
    
    func documentsPathForFileName(name: String) -> URL {
        //let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(name)
        //print(fileURL)
        
        return fileURL
        //print("path: \(path)")
        //let fullpath = path[0] as NSString
        //print("full path: \(fullpath)")
        //let x = fullpath.strings(byAppendingPaths: [name])
        //return x[0]
    }
    
    func saveImgCreatePath(img: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(img)
        let imgName = "image\(NSDate.timeIntervalSinceReferenceDate).png"
        let imgPath = documentsPathForFileName(name: imgName)
        do {
            try imgData?.write(to: imgPath, options: .atomic)
        } catch {
            print(error)
        }
        return imgName
    }
    
    func getImageForPath (path: String) -> UIImage? {
        let imgData: NSData
        
        let fullPath = documentsPathForFileName(name: path)

        do {
            try imgData = NSData(contentsOf: fullPath)
            let image = UIImage(data: imgData as Data)
            return image
        } catch {
            print(error)
        }
        return nil
    }
    
    
}
