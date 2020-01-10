//
//  FirstEnterView.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class FirstEnterView: UIView {
    
    //MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginButtonHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Vars, Constants
    private let loginButtonBorderWidth: CGFloat = 3.0
    private let loginButtonFont: UIFont = .textStyle2
    private let loginButtonColor: UIColor = .babyPurple
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createView()
        setupView()
    }
    
    //MARK: - Private methods
    private func createView() {
        let view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    private func loadFromNib() -> UIView {
        let bundle = Bundle.main
        let nibName = "FirstEnterView"
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    private func setupView() {
        loginButton.layer.cornerRadius = loginButtonHeightConstraint.constant / 2
        loginButton.layer.borderColor = loginButtonColor.cgColor
        loginButton.layer.borderWidth = loginButtonBorderWidth
        loginButton.titleLabel?.font = loginButtonFont
        loginButton.tintColor = loginButtonColor
    }
    
    //MARK: - Actions
    @IBAction func didTappedLoginButton(_ sender: UIButton) {
        
    }
}
