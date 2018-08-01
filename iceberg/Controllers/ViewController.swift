//
//  ViewController.swift
//  iceberg
//
//  Created by Scott Cilento on 7/10/18.
//  Copyright © 2018 iceberg. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    
    @IBOutlet weak var signInLabel: UILabel!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        //flip the boolean
        isSignIn = !isSignIn
        
        //check the bool and set the button and labels
        if  isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        //TO DO: do some form validation on the email and password
        
        if let email = emailTextField.text, let pass = passwordTextField.text{
            
            //check if it is sign in or register
            if isSignIn {
                //sign user in with firebase
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    
                    
                    //check that user isn't nil
                    if let u = user {
                        //user is found, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    } else {
                        //Error: check error and show message
                    }
                }
            }
            else {
                //register with firebase
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    
                    //check that user isn't nil
                    if let u = user {
                        //user is found, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    } else {
                        //Error: check error and show message
                    }
        
                }
                
            }
            
        }
        
        
        
        
        
    }
    
    

}

