//
//  NewSectionViewModel.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/15/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import Foundation
import UIKit

class NewSectionViewModel {

    //MARK: - Vars, Constants
    let timeLabelTitle = "Time"
    let dateLabelTitle = "Date"
    let distanceLabelTitle = "Distance"
    let saveButtonTitle = "Save"
    
    //MARK: - Methods
    func moveToJogsScreen() {
        UserDefault.setBool(true, key: UserDefault.Keys.tableViewContainsData)
        
        let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "JogsScreenViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
}
