//
//  NewSectionViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/12/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class NewSectionViewController: UIViewController {

    //MARK: - Outlets
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
    
    //MARK: - Vars, Constants
    let viewModel = NewSectionViewModel()
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()

        datePickerForDateTextFieldCreate()
        setupNewSectionView()
        self.hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Private methods
    private func setupNewSectionView() {
        newSectionView.layer.cornerRadius = 29
        newSectionView.backgroundColor = .appleGreen
        distanceLabel.text = viewModel.distanceLabelTitle
        distanceLabel.font = .textStyle6
        timeLabel.text = viewModel.timeLabelTitle
        timeLabel.font = .textStyle6
        dateLabel.text = viewModel.dateLabelTitle
        dateLabel.font = .textStyle6
        closeButton.tintColor = .whiteThree
        saveButton.setTitle(viewModel.saveButtonTitle, for: .normal)
        saveButton.layer.cornerRadius = saveButtonHeightConstraint.constant / 2
        saveButton.layer.borderColor = UIColor.whiteThree.cgColor
        saveButton.layer.borderWidth = 2.0
        saveButton.titleLabel?.font = .textStyle7
        saveButton.tintColor = .whiteThree
        saveButton.backgroundColor = .clear
    }
        
    private func datePickerForDateTextFieldCreate() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(NewSectionViewController.datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        dateTextField.inputView = datePicker
    }
    
    @objc private func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        dateTextField.text = formatter.string(from: sender.date)
    }

    private func checkTextFieldsAreNotEmpty() {
        if distanceTextField.text == "" { distanceLabel.textColor = .red }
        else { distanceLabel.textColor = .black }
        if timeTextField.text == "" { timeLabel.textColor = .red }
        else { timeLabel.textColor = .black }
        if dateTextField.text == "" { dateLabel.textColor = .red }
        else { dateLabel.textColor = .black }
    }

    //MARK: - Actions
    @IBAction func didTappedSaveButton(_ sender: UIButton) {
        checkTextFieldsAreNotEmpty()
        
        guard let distance = distanceTextField.text,
              let time = timeTextField.text,
              let date = dateTextField.text else { return }
        
        guard !distance.isEmpty && !time.isEmpty && !date.isEmpty else { return }
        
        let data = [TableViewCellData.init(date: date, distanse: distance, time: time)]
        JogsScreenViewController.tableViewCellData.append(data.first!)
       
        viewModel.moveToJogsScreen()
    }
}
