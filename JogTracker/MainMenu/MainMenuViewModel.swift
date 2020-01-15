//
//  MainMenuViewModel.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit
import Foundation

class MainMenuViewModel {
    
    //MARK: - Constants
    let jogsButtonText = "JOGS"
    let infoButtonText = "INFO"
    let contactUsButtonText = "CONTACT US"
    
    //MARK: - Methods
    func didTappedContactUsButton() {
        UserDefault.setBool(false, key: UserDefault.Keys.isMenuOpen)
        
        let mainMenuViewController = UIStoryboard(name: "ContactUsViewController", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "ContactUsViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
    
    func didTappedInfoButton() {
        UserDefault.setBool(false, key: UserDefault.Keys.isMenuOpen)
        
        let mainMenuViewController = UIStoryboard(name: "InfoViewController", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "InfoViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
    
    func didTappedJogsButton() {
        UserDefault.setBool(false, key: UserDefault.Keys.isMenuOpen)
        
        guard UserDefault.getBool(UserDefault.Keys.isLoggedIn) else { return showLoginScreen() }
        showJogsScreen()
    }
    
    //MARK: - Private methods
    private func showLoginScreen() {
        let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "LoginViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
    
    private func showJogsScreen() {
        let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "JogsScreenViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
}
