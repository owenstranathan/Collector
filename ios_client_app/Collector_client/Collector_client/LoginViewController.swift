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
import BrightFutures

class LoginView: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions

    @IBAction func Login(sender: UIButton) {
        self.errorLabel.text = ""
        
        guard let username = usernameTextField.text where username != "" else{
            self.errorLabel.text = "Username must be set"
            self.usernameTextField.text = ""
            return
        }
        
        guard let password = passwordTextField.text where password != "" else{
            self.errorLabel.text = "Password must be set"
            self.passwordTextField.text = ""
            return
        }
        
        
        let server = Server()
        server.login(username, password:password).onSuccess(){
            result in
            if result{
                print("login successful")
                // NOTE: SEGUE TO PROFILE HERE!
                self.performSegueWithIdentifier("loginSuccessful", sender: nil)
            }
            else{
                self.errorLabel.text = "Unsuccessful login"
            }
        }.onFailure(){
                error in
                print(error)
                print("Error in login")
        }
        
//        let usr_info_ftr : Future<JSON, NoError> = server.getSingleUser(username!)
//        usr_info_ftr.onSuccess(){ result in
//            guard let response_password = result["password"].rawString() else{
//                print("Error getting password from json object")
//                return
//            }
//            if(password == response_password){
//                Server.user = username!
//                Server.password = password!
//                Server.loggedin = true
//            }
//            else{
//                self.errorLabel.text = "That password is incorrect"
//            }
//            }.onFailure(){ error in
//                print("failure in login")
//                print(error)
//        }

    }

}

