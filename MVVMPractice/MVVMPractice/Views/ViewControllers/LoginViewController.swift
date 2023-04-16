//
//  ViewController.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 13/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var loginButtonRef: UIButton!
    @IBOutlet weak var passwordLabel: UITextField!
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func handleLoginButtonTapped(_ sender: Any) {
        let email  = emailLabel.text
        let password = passwordLabel.text
        
        if loginViewModel.isValidLoggingIn(email: email, password: password) {
            // move to tableView
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tableVC = storyboard.instantiateViewController(withIdentifier: "TableViewController")
            self.navigationController?.pushViewController(tableVC, animated: true)
        }else {
            print("Invalid Login")
        }
    }
}

