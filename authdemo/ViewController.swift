//
//  ViewController.swift
//  authdemo
//
//  Created by Decagon on 29/05/2021.
//

import UIKit
import FirebaseUI


class ViewController: UIViewController, FUIAuthDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Firebase Auth Demo"
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        // Get the default auth ui object
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            // Log the error
            return
        }
        // set ourselves as the delegate
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        // get a reference  to the auth ui view controller
        let authViewController = authUI!.authViewController()
        
        // show it
        present(authViewController, animated: true, completion: nil)
        
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        // check if there was an error
//        guard error == nil else {
//            // log the error
//            return
//        }
        // or
        if error != nil {
            // log error
            print(error?.localizedDescription as Any)
            return
        }
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
}


