//
//  server.swift
//  Collector_client
//
//  Created by Owen Stranathan on 11/8/15.
//  Copyright © 2015 Owen Stranathan. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
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
    static var password : String =  "None"
    static var loggedin : Bool = false
    static var userDetails : JSON = nil
    

    static let sharedInstance = Server()
    
    

    
    
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
    
    func POST(urlExtension : String, parameters:Dictionary<String, String>)-> Future<JSON, NoError>{
        let promise = Promise<JSON, NoError>()
        Alamofire.request(Alamofire.Method.POST, SERVER_ROOT_URL+urlExtension, parameters: parameters).responseJSON{ response in
            guard let data = response.data else{
                return
            }
            let json = JSON(data:data)
            print("POST")
            print(json)
            promise.success(json)
        }
        return promise.future
    }
    
    func PUT(urlExtension : String, parameters : Dictionary<String,Int>) -> Future<JSON, NoError>{
        let promise = Promise<JSON, NoError>()
        Alamofire.request(Alamofire.Method.PUT, SERVER_ROOT_URL+urlExtension, parameters: parameters).responseJSON{ response in
            guard let data = response.data else{
                return
            }
            let json = JSON(data:data)
            print("POST")
            print(json)
            promise.success(json)
        }
        return promise.future

    }
    
    func getSingleUser(username : String) -> Future<JSON, NoError>{
        let userInfo : Future<JSON, NoError> = self.GET(USERS + username)
        return userInfo
    }
    
    func createUser(username :String, email:String, password:String) -> Future<JSON, NoError>{
        let parameters = ["username":username, "email":email, "password":password]
        return POST(USERS, parameters:parameters)
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
    
    static func logout() {
        self.user = "None"
        self.password = "None"
        self.loggedin = false
        self.userDetails = nil
    }
    
    // MARK: Collectables
    
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
    
    func getCollectableImage(collectable_name:String) -> Future<UIImage, NoError>{
        return getImageFromURL(SERVER_ROOT_URL+COLLECTABLES+collectable_name+"/image/")
    }

    
    // MARK: Collectors
    
    func getCollector(username:String) -> Future<JSON, NoError>{
        return self.GET(COLLECTORS+username)
    }
    
    func getCollectorImage(username:String) -> Future<UIImage, NoError>{
        return getImageFromURL(SERVER_ROOT_URL+COLLECTORS+username+"/image/")
    }
    
    // MARK: Image
    
    func getImageFromURL(url:String) -> Future<UIImage, NoError>{
        let promise = Promise<UIImage, NoError>()
        print("This is the url request to " + encode_url(url))
        Alamofire.request(Alamofire.Method.GET, encode_url(url)).responseImage{ response in
//            debugPrint(response)
//            debugPrint(response.result)
//            guard let data = response.data else{
//                print("Data not initiailized")
//                return
//            }
            
            guard let image = response.result.value else{
                print("image not aquired")
                return
            }
//            guard let image = UIImage(data:data) else{
//                print("Image not initialized, BAD DATA!")
//                return
//            }
            promise.success(image)
        }
        return promise.future
    }
    
    
    
    
//    func getRandomElement(JSON) -> JSON{
//        
//    }
    
    // MARK: Utils
    
    func encode_url(url:String) -> String{
        var encoded_url : String = ""
        for element in url.characters{
            if(element == " " ){
                encoded_url += "%20"
            }
            else{
                encoded_url.append(element)
            }
            
        }
        return encoded_url
    }

}
