//
//  MainMenuViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var jogsButton: UIButton!
    @IBOutlet private weak var infoButton: UIButton!
    @IBOutlet private weak var contactUsButton: UIButton!
    
    //MARK: - Vars, Constants
    let viewModel = MainMenuViewModel()
    let font: UIFont = .textStyle
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStackViewLabels()
    }
    
    //MARK: - Private methods
    private func setupStackViewLabels() {
        jogsButton.setTitle(viewModel.jogsButtonText, for: .normal)
        jogsButton.titleLabel?.font = font
        jogsButton.tintColor = .black
        
        infoButton.setTitle(viewModel.infoButtonText, for: .normal)
        infoButton.titleLabel?.font = font
        infoButton.tintColor = .black
        
        contactUsButton.setTitle(viewModel.contactUsButtonText, for: .normal)
        contactUsButton.titleLabel?.font = font
        contactUsButton.tintColor = .black
    }
    
    //MARK: - Actions
    @IBAction func didTappedJogsButton(_ sender: UIButton) {
        jogsButton.tintColor = .appleGreen

        viewModel.didTappedJogsButton()
    }
    
    @IBAction func didTappedInfoButton(_ : UIButton) {
        infoButton.tintColor = .appleGreen
        
        viewModel.didTappedInfoButton()
    }
    
    @IBAction func didTappedContactUsButton(_ : UIButton) {
        contactUsButton.tintColor = .appleGreen
        
        viewModel.didTappedContactUsButton()
    }
}
