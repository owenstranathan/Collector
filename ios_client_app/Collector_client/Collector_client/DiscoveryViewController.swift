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
    
    @IBOutlet weak var titleLabel: UINavigationItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)

        // Left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)

        //Up
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeRight)

        //Down
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        // Populate the view
        populate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populate() -> Void{
        
        let server = Server()
        server.getRandomCollectable().onSuccess{
            result in
            //let id = result["id"].int!
            //let resultImageUrl = result["image"].stringValue
            let resultName = result["name"].stringValue
            //let resultCollection = result["collection"].int!
            let resultDescription = result["description"].stringValue
            self.nameLabel.text = resultName
            self.titleLabel.title = resultName
            self.descriptionLabel.text = resultDescription
            print("andThen")
            }.andThen{ result in
                print(result)
                let collectable_name = self.nameLabel.text!
                server.getCollectableImage(collectable_name).onSuccess{
                    result in
                    self.imageView.contentMode = .ScaleAspectFit
                    self.imageView.image = result
                }
            }
        
        
    }
    
    // MARK: Navigation
    
    
    // MARK: Actions
    func respondToSwipeGesture(swipe:UISwipeGestureRecognizer){
        
        switch swipe.direction{
            
        case UISwipeGestureRecognizerDirection.Right:
            populate()
        case UISwipeGestureRecognizerDirection.Down:
            populate()
        case UISwipeGestureRecognizerDirection.Left:
            populate()
        case UISwipeGestureRecognizerDirection.Up:
            populate()
        default:
            break

        }
        
    }
  
}
