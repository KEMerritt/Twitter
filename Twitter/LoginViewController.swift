//
//  LoginViewController.swift
//  Twitter
//
//  Created by Katy Merritt on 9/18/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userloggedin") == true {
            self.performSegue(withIdentifier: "LogintoHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
                                        UserDefaults.standard.set(true, forKey: "userloggedin")
                                        self.performSegue(withIdentifier: "LogintoHome", sender: self)}, failure: { (Error) in
                                            
            print("Could not log in!")
            print(Error)
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
