//
//  LoginViewController.swift
//  Traded
//
//  Created by Edwin Wong on 11/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogintap(_ sender: AnyObject) {
        
    }
    
    // MARK: Google SignIn
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error{
            print(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
         let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
         
         FIRAuth.auth()?.signIn(with: credential, completion: { (user: FIRUser?, error:Error?) in
             if let user = user{
                print(user.displayName)
                print(user.email)
                print(user.providerID)
                print(user.uid)
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
             }
         })
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
