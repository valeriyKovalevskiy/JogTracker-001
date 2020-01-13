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
    @IBOutlet weak var menuButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuButtonWidthConstraint: NSLayoutConstraint!
    
    static var menuState: ActivityState?
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        UpperNavigationPanel.menuState = .unactive
        createView()
        setupUpperPanelState()
        setupMenuActivityState()
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
            
    private func setupUpperPanelState() { //заменить все на свич актив анактив
        guard UserDefault.getBool(UserDefault.Keys.isMenuOpen) else { return UpperNavigationPanel.menuState = .unactive }
        UpperNavigationPanel.menuState = .active
    }
    
    private func setupUnactiveState() {
        menuButton.setBackgroundImage(UIImage(named: "menuButton"), for: .normal)
        backgroundView.backgroundColor = .appleGreen
    }

    private func setupActiveState() {
        menuButtonHeightConstraint.constant = 21
        menuButtonWidthConstraint.constant = 21
        menuButton.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        menuButton.tintColor = .greyish
        backgroundView.backgroundColor = .clear
        logoImageView.image = UIImage(named: "logoActive")
    }
    
    private func setupMenuActivityState() {
        switch UpperNavigationPanel.menuState {
        case .active:
            setupActiveState()
            
        case .unactive:
            setupUnactiveState()
        case .none:
            break
        }
    }

    //MARK: - Actions
    @IBAction func didTappedMenuButton(_ sender: UIButton) {

        
        if menuButton.backgroundImage(for: .normal) == UIImage(systemName: "xmark") {
            let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
            
            if UserDefault.getBool(UserDefault.Keys.isLoggedIn) {
                let menuVC = mainMenuViewController.instantiateViewController(withIdentifier: "JogsScreenViewController")
                (UIApplication.topViewController() as AnyObject).present(menuVC, animated: false, completion: nil)
            } else {
                let menuVC = mainMenuViewController.instantiateViewController(withIdentifier: "ViewController")
                (UIApplication.topViewController() as AnyObject).present(menuVC, animated: false, completion: nil)
            }

        } else {
            UserDefault.setBool(true, key: UserDefault.Keys.isMenuOpen)
            let mainMenuViewController = UIStoryboard(name: "MainMenuViewController", bundle: nil)
            let menuVC = mainMenuViewController.instantiateViewController(withIdentifier: "MainMenuViewController")
            (UIApplication.topViewController() as AnyObject).present(menuVC, animated: false, completion: nil)
        }
        
    }
}
