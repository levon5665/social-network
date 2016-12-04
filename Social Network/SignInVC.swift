//
//  ViewController.swift
//  Social Network
//
//  Created by Levon Tikoyan on 12/2/16.
//  Copyright © 2016 Levon Tikoyan. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyText!
    @IBOutlet weak var pwdField: FancyText!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignInVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }

    @IBAction func fbBtnPressed(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil{
                print("SOCIAL: Failed to authenticate with facebook")
            }else if result?.isCancelled == true {
                print("SOCIAL: User Cancelled Authorization")
            }else{
                print("SOCIAL: Succesfully Authorized vie Facebook")
                let credentals = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.authorizeFireBase(credentals)
            }
        }
    }
    
    func authorizeFireBase(_ credental : FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credental, completion: { (user, error) in
            if error != nil{
                print("SOCIAL: Failed to authenticate with Firebase")
            }else{
                print("SOCIAL: Succesfully Authorized vie Firebase")
                if let user = user{
                    self.completeSignIn(id: user.uid)
                }
            }
        })
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func completeSignIn(id : String){
        let keyChain = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("SOCIAL: Data saved to keychain \(keyChain)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        if let email = emailField.text , let pwd = pwdField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil{
                    print("SOCIAL: Succesfully logged in Firebase")
                    if let user = user{
                        self.completeSignIn(id: user.uid)
                    }
                }else{
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil{
                            print("SOCIAL: Failed to log in Firebase")
                        }else{
                            print("SOCIAL: Succesfully joined in Firebase")
                            if let user = user{
                                self.completeSignIn(id: user.uid)
                            }
                        }
                    })
                }
            })
        }
    }
}

