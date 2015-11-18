//
//  CollectorViewController.swift
//  Collector_client
//
//  Created by Owen Stranathan on 11/17/15.
//  Copyright © 2015 Owen Stranathan. All rights reserved.
//

import Foundation
import UIKit

class CollectorView : UIViewController{
    
    // MARK: Members
    
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populate()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populate() -> Void{
        let username = Server.user
        usernameLabel.text = username
        let server_instance = Server()
        server_instance.getCollector(username).onSuccess{
            result in
            let imageUrl = result["image"].stringValue
            let likes = result["likes"].int!
            print(imageUrl)
            // NOTE: Load the image from url and set as imageView's image instead of just printing it
            self.likesLabel.text = String(likes) + " likes"
            
        
        }
        
        
    }

}