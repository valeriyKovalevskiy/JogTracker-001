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
    
    //MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var loginWindowView: UIView!
    @IBOutlet private weak var closeButton: UIButton!
    
    //MARK: - Vars, Constants
    let viewModel = LoginWindowViewModel()
    let networkingService = NetworkingService()
    let loginButtonColor = UIColor.whiteThree
    override var prefersStatusBarHidden: Bool {
        return true
    }

    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
        setupView()
    }
    
    //MARK: - Private methods
    private func setupView() {
        closeButton.tintColor = .whiteThree
        loginButton.layer.cornerRadius = loginButtonHeightConstraint.constant / 2
        loginButton.layer.borderColor = loginButtonColor.cgColor
        loginButton.layer.borderWidth = 3.0
        loginButton.titleLabel?.font = .textStyle
        loginButton.tintColor = loginButtonColor
        loginButton.setTitle("Login", for: .normal)
        loginWindowView.backgroundColor = .appleGreen
        loginWindowView.layer.cornerRadius = 29
    }
    
    //MARK: - Actions
    @IBAction func didTappedLoginButton(_ sender: UIButton) {
        
        guard loginTextField.text != "", passwordTextField.text != "" else { return }
        guard let username = loginTextField.text, let password = passwordTextField.text else { return }
        
        let parameters = ["uuid" : username, "password" : password]
        networkingService.request(endpoint: "/v1/auth/uuidLogin", parameters: parameters) { (result) in
            guard UserDefault.getBool(UserDefault.Keys.validResponse) else { return self.titleLabel.text = "Try again?" }
        
            self.viewModel.moveJogsViewController()
        }
    }
}
