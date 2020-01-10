//
//  ViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginButtonHeightConstraint: NSLayoutConstraint!
    
    private let loginButtonBorderWidth: CGFloat = 3.0
    private let loginButtonFont: UIFont = .textStyle2
    private let loginButtonColor: UIColor = .babyPurple
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLoginButton()
    }
    
    func setupLoginButton() {
        loginButton.layer.cornerRadius = loginButtonHeightConstraint.constant / 2
        loginButton.layer.borderColor = loginButtonColor.cgColor
        loginButton.layer.borderWidth = loginButtonBorderWidth
        loginButton.titleLabel?.font = loginButtonFont
        loginButton.tintColor = loginButtonColor
    }
    
    @IBAction func didTappedLoginButton(_ sender: UIButton) {
    }
    
}

