//
//  ViewController.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 13/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var loginButtonRef: UIButton!
    @IBOutlet weak var passwordLabel: UITextField!
    let loginViewModel = LoginViewModel()
    //var mainCoordinator : MainCoordinator?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1 viewDidLoad LoginViewController")
        
        emailLabel.text = "a@gmail.com"
        passwordLabel.text = "123456"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //super.viewWillAppear(true)
        print("2 ViewWillAppear LoginViewController")
    }
    
    override func viewWillLayoutSubviews() {
        //super.viewWillLayoutSubviews()
        print("3 viewWillLayoutSubviews LoginViewController")
    }
    override func viewDidLayoutSubviews() {
        //super.viewDidLayoutSubviews()
        print("4 viewDidLayoutSubviews LoginViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //super.viewDidAppear(true)
        print("5 viewDidAppear LoginViewController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("6 viewWillDisappear LoginViewController")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("7 viewDidDisappear LoginViewController")
    }
    

    @IBAction func handleLoginButtonTapped(_ sender: Any) {
        let email  = emailLabel.text
        let password = passwordLabel.text
        if loginViewModel.isValidLoggingIn(email: email, password: password) {
            // move to tableView
            LoginViewCoordinator.shared.goToTableView()
        }else {
            print("Invalid Login")
        }
    }
}

