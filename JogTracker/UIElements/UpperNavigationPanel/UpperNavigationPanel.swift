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
    @IBOutlet private weak var filterButton: UIButton!
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet weak var menuButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuButtonWidthConstraint: NSLayoutConstraint!
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        createView()
        setupUpperPanelState()
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
        guard UserDefault.getBool(UserDefault.Keys.isMenuOpen) else { return setupUnactiveState() }
        
        filterButton.isHidden = true
        setupActiveState()
    }
    
    private func setupUnactiveState() {
        menuButton.setBackgroundImage(UIImage(named: "menuButton"), for: .normal)
        backgroundView.backgroundColor = .appleGreen
        guard UserDefault.getBool(UserDefault.Keys.tableViewContainsData) &&
            UserDefault.getBool(UserDefault.Keys.isTableViewController) else { return }
        filterButton.isHidden = false
    }

    private func setupActiveState() {
        menuButtonHeightConstraint.constant = 21
        menuButtonWidthConstraint.constant = 21
        menuButton.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        menuButton.tintColor = .greyish
        backgroundView.backgroundColor = .clear
        logoImageView.image = UIImage(named: "logoActive")
    }

    //MARK: - Actions
    @IBAction func didTappedMenuButton(_ sender: UIButton) {
        UserDefault.setBool(true, key: UserDefault.Keys.isMenuOpen)
        let mainMenuViewController = UIStoryboard(name: "MainMenuViewController", bundle: nil)
        let menuVC = mainMenuViewController.instantiateViewController(withIdentifier: "MainMenuViewController")
        (UIApplication.topViewController() as AnyObject).present(menuVC, animated: true, completion: nil)
    }
    
    @IBAction func didTappedFilterButton(_ sender: UIButton) {
        print("it's me")
    }
}
