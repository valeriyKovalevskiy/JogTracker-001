//
//  InfoScreenViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var infoTextView: UITextView!
    
    //MARK: - Vars, Constants
    let viewModel = InfoScreenViewModel()
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitleLabel()
        setupTextView()
    }
    
    //MARK: - Private methods
    private func setupTitleLabel() {
        titleLabel.text = viewModel.titleLabelText
        titleLabel.font = UIFont.textStyle
        titleLabel.textColor = .appleGreen
    }
    
    private func setupTextView() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        let foregroundColor = UIColor.darkGray
        let font = UIFont.textStyle5
        let attributes = [NSAttributedString.Key.paragraphStyle : paragraphStyle, NSAttributedString.Key.foregroundColor : foregroundColor, NSAttributedString.Key.font : font]
        infoTextView.attributedText = NSAttributedString(string: viewModel.textViewText, attributes: attributes)
    }
}
