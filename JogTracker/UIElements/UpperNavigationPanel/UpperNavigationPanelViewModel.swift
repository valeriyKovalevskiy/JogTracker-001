//
//  UpperNavigationPanelViewModel.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/15/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import Foundation
import UIKit

class UpperNavigationPanelViewModel {
    func openMenu() {
        UserDefault.setBool(true, key: UserDefault.Keys.isMenuOpen)
        let destinationStoryboard = UIStoryboard(name: "MainMenuViewController", bundle: nil)
        let destinationVC = destinationStoryboard.instantiateViewController(withIdentifier: "MainMenuViewController")
        (UIApplication.topViewController() as AnyObject).present(destinationVC, animated: true, completion: nil)
    }
    
    func closeMenu() {
        UserDefault.setBool(false, key: UserDefault.Keys.isMenuOpen)
        
        guard UserDefault.getBool(UserDefault.Keys.isLoggedIn) else { return
            openLoginViewController()
        }
        openJogsViewController()
    }
    
    func openJogsViewController() {
        let destinationStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = destinationStoryboard.instantiateViewController(withIdentifier: "JogsScreenViewController")
        (UIApplication.topViewController() as AnyObject).present(destinationVC, animated: true, completion: nil)
    }
    
    func openLoginViewController() {
        let destinationStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = destinationStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
        (UIApplication.topViewController() as AnyObject).present(destinationVC, animated: true, completion: nil)
    }
}
