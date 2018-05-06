//
//  AuthService.swift
//  Breakpoint
//
//  Created by Nessin Elkharrat on 4/26/18.
//  Copyright © 2018 practice. All rights reserved.
//



//Make sure to look at appDelegate for extra code!!!*****

import Foundation
import Firebase

class AuthService {
    //singleton - gives us access to it throughout lifecycle of app in any class
    static let instance =  AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping COMPLETE) {
        //createUser is a firebase function
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                 userCreationComplete(false,error)
                return
            }
            
            //many different kinds of providers like facebook, email...
            let userData = ["provider": user.providerID, "email": user.email]
            //if no error, create account for the user. Need a dictionary
            //pulling uid from firebase
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping COMPLETE) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginComplete(false, error)
                return
        }
            loginComplete(true, nil)
            }
    
        }
    
    }
