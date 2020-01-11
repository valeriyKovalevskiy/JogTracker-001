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
        let nibName = "UpperNavigationPanel"
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    private func setupView() {
        backgroundView.backgroundColor = .appleGreen
    }

    //MARK: - Actions
    @IBAction func didTappedMenuButton(_ sender: UIButton) {
        print("hello")
        let mainMenuViewController = UIStoryboard(name: "MainMenuViewController", bundle: nil)
        let debugVC = mainMenuViewController.instantiateViewController(withIdentifier: "MainMenuViewController")
        (UIApplication.topViewController() as AnyObject).present(debugVC, animated: true, completion: nil)
        
    }
    
    @IBAction func didTappedFilterButton(_ sender: UIButton) {
        print("it's me")
    }
}
