//
//  LoginWindowViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/12/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit
import Foundation

class LoginWindowViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginWindowView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let loginButtonTintColor = UIColor.whiteThree
    let loginButtonBorderWidth: CGFloat = 3.0
    let loginButtonFont = UIFont.textStyle
    let loginButtonColor = UIColor.whiteThree
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
        setupView()
    }
    
    private func checkTextFieldsAreNotEmpty() {
        guard loginTextField.text != "", passwordTextField.text != "" else { return titleLabel.text = "Try again?"}
    }
    
    private func setupView() {
        
        closeButton.tintColor = .whiteThree
        
        loginButton.layer.cornerRadius = loginButtonHeightConstraint.constant / 2
        loginButton.layer.borderColor = loginButtonTintColor.cgColor
        loginButton.layer.borderWidth = loginButtonBorderWidth
        loginButton.titleLabel?.font = loginButtonFont
        loginButton.tintColor = loginButtonColor
        loginButton.setTitle("Login", for: .normal)
        
        loginWindowView.backgroundColor = .appleGreen
        loginWindowView.layer.cornerRadius = 29
        
    }
    
    @IBAction func didTappedLoginButton(_ sender: UIButton) {
        checkTextFieldsAreNotEmpty()
        
        guard loginTextField.text != "" && passwordTextField.text != "" else { return } //поменяется на какой-то другой
        
        UserDefault.setBool(true, key: UserDefault.Keys.isLoggedIn)
        let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "JogsScreenViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
}
