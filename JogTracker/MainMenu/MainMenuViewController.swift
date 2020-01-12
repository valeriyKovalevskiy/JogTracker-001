//
//  MainMenuViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var jogsButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var contactUsButton: UIButton!
    
    let jogsButtonText = "JOGS"
    let infoButtonText = "INFO"
    let contactUsButtonText = "CONTACT US"
    let font: UIFont = .textStyle
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStackViewLabels()
    }
    
    func setupStackViewLabels() {

        jogsButton.setTitle(jogsButtonText, for: .normal)
        jogsButton.titleLabel?.font = font
        jogsButton.tintColor = .black
        
        infoButton.setTitle(infoButtonText, for: .normal)
        infoButton.titleLabel?.font = font
        infoButton.tintColor = .black
        
        contactUsButton.setTitle(contactUsButtonText, for: .normal)
        contactUsButton.titleLabel?.font = font
        contactUsButton.tintColor = .black
    }
    
    @IBAction func didTappedJogsButton(_ sender: UIButton) {
        UserDefault.setBool(false, key: UserDefault.Keys.isMenuOpen)
        jogsButton.tintColor = .appleGreen
        guard UserDefault.getBool(UserDefault.Keys.isLoggedIn) else { return showLoginScreen() }
        showJogsScreen()
    }
    
    func showLoginScreen() {
        let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "ViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
    func showJogsScreen() {
        let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "JogsScreenViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
    
    @IBAction func didTappedInfoButton(_ : UIButton) {
        UserDefault.setBool(false, key: UserDefault.Keys.isMenuOpen)
        infoButton.tintColor = .appleGreen
        let mainMenuViewController = UIStoryboard(name: "InfoViewController", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "InfoViewController")
        show(controller, sender: infoButton)
    }
    @IBAction func didTappedContactUsButton(_ : UIButton) {
        UserDefault.setBool(false, key: UserDefault.Keys.isMenuOpen)
        contactUsButton.tintColor = .appleGreen
        let mainMenuViewController = UIStoryboard(name: "ContactUsViewController", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "ContactUsViewController")
        show(controller, sender: contactUsButton)

    }
    
}
