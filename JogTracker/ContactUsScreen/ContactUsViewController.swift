//
//  ContactUsViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var webpageLabel: UILabel!

    //MARK: - Vars, Constants
    let viewModel = ContactUsViewModel()
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
    }

    //MARK: - Private methods
    private func setupLabels() {
        titleLabel.text = viewModel.titleLabelText
        titleLabel.font = UIFont.textStyle
        titleLabel.textColor = .appleGreen
        
        numberLabel.text = viewModel.numberLabelText
        numberLabel.font = UIFont.textStyle2
        numberLabel.textColor = .black
        
        emailLabel.text = viewModel.emailLabelText
        emailLabel.font = UIFont.textStyle2
        emailLabel.textColor = .black
        
        webpageLabel.text = viewModel.webpageLabelText
        webpageLabel.font = UIFont.textStyle6
        webpageLabel.textColor = .black
    }
    
}
