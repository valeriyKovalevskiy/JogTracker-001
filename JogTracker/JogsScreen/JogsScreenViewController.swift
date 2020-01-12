//
//  JogsScreenViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/12/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class JogsScreenViewController: UIViewController {

    @IBOutlet weak var emptyTableView: UIView!
    @IBOutlet weak var emptyTableViewLabel: UILabel!
    @IBOutlet weak var emptyTableViewButton: UIButton!
    @IBOutlet weak var emptyTableViewButtonHeightConstraint: NSLayoutConstraint!
    
        
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstEnter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserDefault.setBool(true, key: UserDefault.Keys.isTableViewController)

    }
    
    func firstEnter() {
        guard !UserDefault.getBool(UserDefault.Keys.tableViewContainsData) else { return emptyTableView.isHidden = true }
        emptyTableViewLabel.font = .textStyle1
        emptyTableViewLabel.textColor = .greyish
        
        emptyTableViewButton.layer.cornerRadius = emptyTableViewButtonHeightConstraint.constant / 2
        emptyTableViewButton.layer.borderColor = UIColor.babyPurple.cgColor
        emptyTableViewButton.layer.borderWidth = 3.0
        emptyTableViewButton.titleLabel?.font = .textStyle2
        emptyTableViewButton.tintColor = .babyPurple
        emptyTableViewButton.setTitle("Create your jog first", for: .normal)
    }
}


