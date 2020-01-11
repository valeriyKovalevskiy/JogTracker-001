//
//  ContactUsViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var webpageLabel: UILabel!
    
    let titleLabelText = "CONTACT US" //From model
    let numberLabelText = "375 (33) 902-15-31"
    let emailLabelText = "Kovalevskiy2021@gmail.com"
    let webpageLabelText = "github.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitleLabel()
        setupStackViewLabels()
    }
    
    func setupTitleLabel() {
        titleLabel.text = titleLabelText
        titleLabel.font = UIFont.textStyle
        titleLabel.textColor = .appleGreen
    }
    
    func setupStackViewLabels() {
        numberLabel.text = numberLabelText
        numberLabel.font = UIFont.textStyle2
        numberLabel.textColor = .black
        
        emailLabel.text = emailLabelText
        emailLabel.font = UIFont.textStyle2
        emailLabel.textColor = .black
        
        webpageLabel.text = webpageLabelText
        webpageLabel.font = UIFont.textStyle2
        webpageLabel.textColor = .black
    }
    
}
