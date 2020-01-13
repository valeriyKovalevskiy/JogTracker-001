//
//  UIViewController+Addition.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/13/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

