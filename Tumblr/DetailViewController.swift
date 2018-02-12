//
//  DetailViewController.swift
//  Tumblr
//
//  Created by Tavien on 2/11/18.
//  Copyright © 2018 Warpedflo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var Blog: UILabel!
    
    @IBOutlet weak var postDate: UILabel!
    
    @IBOutlet weak var Comment: UILabel!
    
    var posts:[String: Any]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let posts = posts
        {
            postDate.text = posts["date"] as? String
            Comment.text = posts["caption"] as? String
            Blog.text = posts["blog_name"] as? String
            if let photos = posts["photos"] as? [[String: Any]]
            {
                let photo = photos[0]
                // 2.
                let originalSize = photo["original_size"] as! [String: Any]
                // 3.
                let urlString = originalSize["url"] as! String
                // 4.
                let url = URL(string: urlString)
                
               self.postImageView.af_setImage(withURL: url!)
                // self.tableView.reloadData()
            }
       }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
