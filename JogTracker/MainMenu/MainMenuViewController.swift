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
    }
    @IBAction func didTappedInfoButton(_ sender: UIButton) {
        let mainMenuViewController = UIStoryboard(name: "InfoViewController", bundle: nil)
        let debugVC = mainMenuViewController.instantiateViewController(withIdentifier: "InfoViewController")
        (UIApplication.topViewController() as AnyObject).present(debugVC, animated: true, completion: nil)
        
    }
    @IBAction func didTappedContactUsButton(_ sender: UIButton) {
        let mainMenuViewController = UIStoryboard(name: "ContactUsViewController", bundle: nil)
        let debugVC = mainMenuViewController.instantiateViewController(withIdentifier: "ContactUsViewController")
        (UIApplication.topViewController() as AnyObject).present(debugVC, animated: true, completion: nil)
        
    }
    
}
