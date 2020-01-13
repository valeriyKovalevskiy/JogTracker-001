//
//  AddNewSectionViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/12/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit


struct TableViewCellData {
    let date: String
    let distanse: String
    let time: String
    
    init(date: String, distanse: String, time: String) {
        self.date = date
        self.distanse = distanse
        self.time = time
    }
}

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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNewSectionView()
        self.hideKeyboardWhenTappedAround()
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
    
    private func checkTextFieldsAreNotEmpty() {
        if distanceTextField.text == "" { distanceLabel.textColor = .red }
        else { distanceLabel.textColor = .black }
        if timeTextField.text == "" { timeLabel.textColor = .red }
        else { timeLabel.textColor = .black }
        if dateTextField.text == "" { dateLabel.textColor = .red }
        else { dateLabel.textColor = .black }
    }

    @IBAction func didTappedSaveButton(_ sender: UIButton) {
        checkTextFieldsAreNotEmpty()
        
        guard distanceTextField.text != "" && timeTextField.text != "" && dateTextField.text != "" else { return }
        
        let data = [TableViewCellData.init(date: dateTextField.text ?? "", distanse: distanceTextField.text ?? "", time: timeTextField.text ?? "")]
        JogsScreenViewController.tableViewCellData.append(data.first!)
        UserDefault.setBool(true, key: UserDefault.Keys.tableViewContainsData)
        let mainMenuViewController = UIStoryboard(name: "Main", bundle: nil)
        let controller = mainMenuViewController.instantiateViewController(withIdentifier: "JogsScreenViewController")
        (UIApplication.topViewController() as AnyObject).present(controller, animated: true, completion: nil)
    }
}
