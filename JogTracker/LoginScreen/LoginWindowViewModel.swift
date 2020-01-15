//
//  LoginWindowViewModel.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class LoginWindowViewModel {
    
    func moveJogsViewController() {
        UserDefault.setBool(true, key: UserDefault.Keys.isLoggedIn)
        
        let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "JogsScreenViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
}

struct User: Decodable {
    let access_token: String
    let username: String
    let password: String
}

