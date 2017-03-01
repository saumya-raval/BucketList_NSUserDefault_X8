//
//  ViewController.swift
//  BucketList_NSUserDefaults_X8
//
//  Created by Saumya Raval on 2/22/17.
//  Copyright © 2017 PlayAgain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        dataService.instance.loadPosts()
        NotificationCenter.default.addObserver(self, selector: #selector(self.onPostLoaded(notif:)), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)

    }
    
    func onPostLoaded(notif: NSNotification) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let new = dataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post: new)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post: new)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.instance.loadedPosts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

