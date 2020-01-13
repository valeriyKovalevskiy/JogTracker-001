//
//  JogsScreenViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/12/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class JogsScreenViewController: UIViewController {
    

    
    var filterMenuState: ActivityState = .unactive
    var buttonState: ActivityState = .unactive

    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var filterViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var emptyTableView: UIView!
    @IBOutlet weak var emptyTableViewLabel: UILabel!
    @IBOutlet weak var emptyTableViewButton: UIButton!
    @IBOutlet weak var emptyTableViewButtonHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var filterButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var filterButtonHeightConstraint: NSLayoutConstraint!
    
    private let cellIdentifier = "Cell"
    private let cellNibName = "JogsTableViewCell"
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        filterViewHeightConstraint.constant = 0
        filterView.isHidden = true
        firstEnter()
//                register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellIdentifier) tableview
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func showJogsTableView() {
        emptyTableView.isHidden = true
        filterButton.isHidden = false
    }
    
    func firstEnter() {
        guard !UserDefault.getBool(UserDefault.Keys.tableViewContainsData) else { return showJogsTableView() }
        emptyTableViewLabel.font = .textStyle1
        emptyTableViewLabel.textColor = .greyish
        
        emptyTableViewButton.layer.cornerRadius = emptyTableViewButtonHeightConstraint.constant / 2
        emptyTableViewButton.layer.borderColor = UIColor.babyPurple.cgColor
        emptyTableViewButton.layer.borderWidth = 3.0
        emptyTableViewButton.titleLabel?.font = .textStyle2
        emptyTableViewButton.tintColor = .babyPurple
        emptyTableViewButton.setTitle("Create your jog first", for: .normal)
    }
    
    private func filterButtonStateChanged() {
        switch buttonState {
        case .active:
            filterButtonWidthConstraint.constant = filterButtonWidthConstraint.constant / 1.5
            filterButtonHeightConstraint.constant = filterButtonHeightConstraint.constant / 1.5
            filterButton.setBackgroundImage(UIImage(named: "filter"), for: .normal)
            buttonState = .unactive
        case .unactive:
            filterButtonWidthConstraint.constant = filterButtonWidthConstraint.constant * 1.5
            filterButtonHeightConstraint.constant = filterButtonHeightConstraint.constant * 1.5
            filterButton.setBackgroundImage(UIImage(named: "filterActive"), for: .normal)
            buttonState = .active
        }
    }
    
    private func filterViewStateChanged() {
        switch filterMenuState {
        case .unactive:
            filterViewHeightConstraint.constant = 60
            filterView.isHidden = false
            filterMenuState = .active
        case .active:
            filterViewHeightConstraint.constant = 0
            filterView.isHidden = true
            filterMenuState = .unactive
        }
    }
        
    @IBAction func didTappedFilterButton(_ sender: UIButton) {
            filterButtonStateChanged()
            filterViewStateChanged()
        }
    }



