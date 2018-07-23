//
//  ViewController.swift
//  iceberg
//
//  Created by Scott Cilento on 7/10/18.
//  Copyright © 2018 iceberg. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adds Login button and puts it on the screen
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        //use constraints instead of frames, preferably
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

