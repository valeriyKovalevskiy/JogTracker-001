//
//  LoginViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var loginButtonHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Vars, Constants
    private let loginButtonBorderWidth: CGFloat = 3.0
    private let loginButtonColor: UIColor = .babyPurple
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        checkLogin()
        setupView()
    }
    
    //MARK: - Private methods
    private func checkLogin() {
        if UserDefault.getBool(UserDefault.Keys.isLoggedIn) {
            let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
            let controller = mainMenuViewController.instantiateViewController(withIdentifier: "JogsScreenViewController")
            (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
        }
    }
    
    private func setupView() {
        loginButton.layer.cornerRadius = loginButtonHeightConstraint.constant / 2
        loginButton.layer.borderColor = loginButtonColor.cgColor
        loginButton.layer.borderWidth = loginButtonBorderWidth
        loginButton.titleLabel?.font = .textStyle2
        loginButton.tintColor = loginButtonColor
    }
}

