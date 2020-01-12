//
//  AddNewSectionViewController.swift
//  JogTracker
//
//  Created by валерий on 1/12/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class AddNewSectionViewController: UIViewController {

    @IBOutlet weak var newSectionView: UIView!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var saveButtonHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceTextField: UITextField!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefault.setBool(false, key: UserDefault.Keys.isTableViewController)
        setupNewSectionView()

    }
    
    func setupNewSectionView() {
        
        closeButton.tintColor = .whiteThree
        
        newSectionView.layer.cornerRadius = 29
        newSectionView.backgroundColor = .appleGreen
        
        distanceLabel.text = "Distance"
        distanceLabel.font = .textStyle6
        timeLabel.text = "Time"
        timeLabel.font = .textStyle6
        dateLabel.text = "Date"
        dateLabel.font = .textStyle6
        
        saveButton.layer.cornerRadius = saveButtonHeightConstraint.constant / 2
        saveButton.layer.borderColor = UIColor.whiteThree.cgColor
        saveButton.layer.borderWidth = 2.0
        saveButton.titleLabel?.font = .textStyle7
        saveButton.tintColor = .whiteThree
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .clear
        
        
        
    }
    
    
    
    
    
    
    @IBAction func didTappedSaveButton(_ sender: UIButton) {
        //duard not empty
        UserDefault.setBool(true, key: UserDefault.Keys.tableViewContainsData)
    }

    
}
