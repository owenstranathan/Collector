//
//  DiscoveryViewController.swift
//  Collector_client
//
//  Created by Owen Stranathan on 11/17/15.
//  Copyright © 2015 Owen Stranathan. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import BrightFutures

class DiscoveryView : UIViewController{
   
    // MARK: Members
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populate() -> Void{
        
        let server = Server()
        
        let collectable = server.getRandomCollectable()
        collectable.onSuccess{
            result in
            let resultImageUrl = result["image"].stringValue
            let resultName = result["name"].stringValue
            let resultCollection = result["collection"].int!
            let resultDescription = result["description"].stringValue
            self.nameLabel.text = resultName
            self.descriptionLabel.text = resultDescription
            
            print(resultImageUrl)
            
            print(resultCollection)
            
        }

        
    }
    
    // MARK: Actions

    @IBAction func swipeHandler(sender: UISwipeGestureRecognizer) {
    }
  
}
