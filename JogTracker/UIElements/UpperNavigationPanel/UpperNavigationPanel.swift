//
//  UpperNavigationPanel.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class UpperNavigationPanel: UIView {
    
    //MARK: - Outlets
    @IBOutlet private weak var menuButton: UIButton!
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var menuButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var menuButtonWidthConstraint: NSLayoutConstraint!
    
    let viewModel = UpperNavigationPanelViewModel()
    private var menuButtonState: ActivityState?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        createView()
        setupUpperPanelState()
        switchUpperPanelActivityState()
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
        let nibName = "UpperNavigationPanel"
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
            
    private func setupUpperPanelState() {
        
        guard UserDefault.getBool(UserDefault.Keys.isMenuOpen) else { return menuButtonState = .unactive }
        
        menuButtonState = .active
    }
    
    private func upperPanelUnactiveState() {
        menuButton.setBackgroundImage(UIImage(named: "menuButton"), for: .normal)
        backgroundView.backgroundColor = .appleGreen
    }

    private func upperPanelActiveState() {
        menuButtonHeightConstraint.constant = 21
        menuButtonWidthConstraint.constant = 21
        menuButton.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        menuButton.tintColor = .greyish
        backgroundView.backgroundColor = .clear
        logoImageView.image = UIImage(named: "logoActive")
    }
    
    private func switchUpperPanelActivityState() {
        switch menuButtonState {
        case .active: upperPanelActiveState()
        case .unactive: upperPanelUnactiveState()
        default: break
        }
    }
    
    //MARK: - Actions
    @IBAction func didTappedMenuButton(_ sender: UIButton) {
        
        guard menuButtonState == .active else { return viewModel.openMenu() }
        
        viewModel.closeMenu()
    }
}
