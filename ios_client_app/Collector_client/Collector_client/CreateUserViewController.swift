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
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
   
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
  
    @IBAction func CreateUser(sender: UIButton) {
        
    }
}