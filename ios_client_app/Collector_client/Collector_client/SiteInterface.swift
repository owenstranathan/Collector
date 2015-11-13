//
//  server.swift
//  Collector_client
//
//  Created by Owen Stranathan on 11/8/15.
//  Copyright © 2015 Owen Stranathan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import BrightFutures

let SERVER_ROOT_URL = "http://127.0.0.1:8000/"
let USERS = "users/"
let COLLECTORS = "collectors/"
let TOPICS = "topics/"
let COLLECTIONS = "collections/"
let COLLECTABLES = "collectables/"

class Server{
    
    
    //MARK: Members
    var get : JSON = nil
    var user : String = ""
    
    // MARK: Initializer
    init() {}
    
    // MARK: GET and POST
    func GET(urlExtension : String) -> Future<JSON, NoError>{
        let promise = Promise<JSON, NoError>()
        Alamofire.request(.GET, SERVER_ROOT_URL+urlExtension).responseJSON{ response in
            guard let data = response.data else{
                return
            }
            let json = JSON(data:data)
            promise.success(json)
        }
        return promise.future
    }
    
    //    func POST(urlExtension : String? = "") -> JSON
    //    {
    //        guard let unwrappedUrl = urlExtension else{
    //            return nil
    //        }
    //        var result : JSON = nil
    //    }

    // MARK: User functions
    
    func getSingleUser(username : String) -> Future<JSON, NoError>{
        let userInfo : .Future<JSON, NoError> = self.GET(USERS + username)
        return userInfo
    }
    
//    // MARK: Login/Logout
//    func login(username : String, password:String) ->String{
//        
//    }
//    
    
}
