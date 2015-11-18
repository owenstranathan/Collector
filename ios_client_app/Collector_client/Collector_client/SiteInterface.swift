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
    
    // MARK: Members
    // Static user variable (ie, only one user can be signed in at one time)
    static var user : String = "None"
    static var user_id : Int = 0
    static var password : String =  "None"
    static var loggedin : Bool = false
    static var userDetails : JSON = nil
    

    static let sharedInstance = Server()
    
    
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
        let userInfo : Future<JSON, NoError> = self.GET(USERS + username)
        return userInfo
    }
    
    
    // MARK: Login/Logout
    
    // Login: Returns true if login successful and false if otherwize
    func login(username : String, password : String) -> Future<Bool, NoError> {
        let promise = Promise<Bool, NoError>()
        let usr_info_ftr : Future<JSON, NoError> = getSingleUser(username)
        usr_info_ftr.onSuccess(){ result in
            guard let response_password = result["password"].rawString() else{
                print("Error getting password from json object")
                return
            }
            if(password == response_password){
                Server.user = username
                Server.password = password
                Server.userDetails = result
                Server.loggedin = true
                print(result)
                promise.success(true)
            }
            else{
                promise.success(false)
            }
        }.onFailure(){ error in
                promise.failure(error)
        }
        return promise.future
    }
    
    func getRandomCollectable()-> Future<JSON, NoError>{
        let promise = Promise<JSON, NoError>()
        Alamofire.request(.GET, SERVER_ROOT_URL+COLLECTABLES).responseJSON{ response in
            guard let data = response.data else{
                return
            }
            let json = JSON(data:data)
            //This is ugly random number generation
            let random = Int(arc4random_uniform(UInt32(json.count)))
            //print(json[random])

            promise.success(json[random])
        }
        return promise.future
    }
    
    func getCollector(username:String) -> Future<JSON, NoError>{
        return self.GET(COLLECTORS+username)
    }

//    func getRandomElement(JSON) -> JSON{
//        
//    }
    

}
