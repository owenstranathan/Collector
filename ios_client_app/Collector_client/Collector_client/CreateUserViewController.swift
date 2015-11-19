//
//  CreateUserViewController.swift
//  Collector_client
//
//  Created by Owen Stranathan on 11/15/15.
//  Copyright © 2015 Owen Stranathan. All rights reserved.
//

import Foundation

import UIKit

class CreateUserView : UIViewController{
    
    // MARK: Members
    
    
    // MARK: Outlets
    
    
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
  
    @IBAction func CreateUser(sender: UIButton) {
        
        //Reset labels
        self.emailLabel.textColor = UIColor.blackColor()
        self.usernameLabel.textColor = UIColor.blackColor()
        self.passwordLabel.textColor = UIColor.blackColor()
        confirmPasswordLabel.textColor = UIColor.blackColor()

        
        let password : String = passwordTextField.text!
        let confirmPassword : String = confirmPasswordTextField.text!
        
        if password != confirmPassword{
            passwordLabel.textColor = UIColor.redColor()
            confirmPasswordLabel.textColor = UIColor.redColor()
            return
        }
        
        let email : String = emailTextField.text!
        let username : String = usernameTextField.text!
        
        print(email)
        let server = Server()
        server.createUser(username, email: email, password: password).onSuccess{ result in
            if result["username"].stringValue == username{
                let alert = UIAlertController(title: "Alert", message: "Created Successfully", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                self.emailLabel.textColor = UIColor.blackColor()
                self.usernameLabel.textColor = UIColor.blackColor()
                self.passwordLabel.textColor = UIColor.blackColor()
            }
            else{
                self.usernameLabel.textColor = UIColor.redColor()
            }
            
            if result["email"].stringValue != email{
                self.emailLabel.textColor = UIColor.redColor()
            }
        }
        
    }
}