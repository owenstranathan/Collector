//
//  ViewController.swift
//  Collector_client
//
//  Created by Owen Stranathan on 11/8/15.
//  Copyright © 2015 Owen Stranathan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let parameters = ["username":"owenstranathan"]
//        Alamofire.request(.GET, "http://127.0.0.1:8000/users/getUserbyName/", parameters : parameters)
//            .responseJSON { response in
//                guard let data = response.data else{
//                    return
//                }
//                let json = JSON(data:data)
//                print(json)
////                for (_,user) in json{
////                    print(user)
////                    if(user["username"] == "owenstranathan"){
////                        print(user["email"])
////                        print(user["username"])
////                    }
////                }
//                
//            }
        let server = Server()
        print(server.getSingleUser("owenstranathan"))
//        server.getSingleUser("owenstranathan").responseJSON{ response in
//            guard let data = response.data else{
//                return
//            }
//            let json = JSON(data:data)
//            server.get = json
//            print(json)
//        }
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

