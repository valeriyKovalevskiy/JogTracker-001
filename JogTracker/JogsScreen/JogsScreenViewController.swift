//
//  JogsScreenViewController.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/12/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

class JogsScreenViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyTableView: UIView!
    @IBOutlet private weak var emptyTableViewLabel: UILabel!
    @IBOutlet private weak var emptyTableViewButton: UIButton!
    @IBOutlet private weak var emptyTableViewButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var filterView: UIView!
    @IBOutlet private weak var filterButton: UIButton!
    @IBOutlet private weak var filterViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var filterButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var filterButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var dateFromTextField: UITextField!
    @IBOutlet private weak var dateToTextField: UITextField!
    @IBOutlet private weak var dateFromLabel: UILabel!
    @IBOutlet private weak var dateToLabel: UILabel!
    
    //MARK: - Vars, Constants
    private var filterMenuState: ActivityState = .unactive
    private var buttonState: ActivityState = .unactive
    var filteredData = [TableViewCellData]()
    var isFiltering: Bool = false
    static var tableViewCellData = [TableViewCellData]()
    override var prefersStatusBarHidden: Bool {
        return true
    }

    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        firstEnter()
        setupDatePickers()
        setupFilterView()
        setupTableView()
    }
    
    //MARK: - Private methods
    private func firstEnter() {
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
    
    private func showJogsTableView() {
        emptyTableView.isHidden = true
        filterButton.isHidden = false
    }
    
    private func setupDatePickers() {
        let datePickerFrom = UIDatePicker()
        datePickerFrom.datePickerMode = UIDatePicker.Mode.date
        datePickerFrom.addTarget(self, action: #selector(JogsScreenViewController.fromDatePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        dateFromTextField.inputView = datePickerFrom
        
        let datePickerTo = UIDatePicker()
        datePickerTo.datePickerMode = UIDatePicker.Mode.date
        datePickerTo.addTarget(self, action: #selector(JogsScreenViewController.toDatePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        dateToTextField.inputView = datePickerTo
    }
    
    @objc private func toDatePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        formatter.timeStyle = DateFormatter.Style.none
        dateToTextField.text = formatter.string(from: sender.date)
    }
    
    @objc private func fromDatePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        formatter.timeStyle = DateFormatter.Style.none
        dateFromTextField.text = formatter.string(from: sender.date)
    }
    
    private func setupFilterView() {
        filterViewHeightConstraint.constant = 0
        dateToTextField.layer.borderColor = UIColor.warmGrey.cgColor
        dateToTextField.backgroundColor = .whiteThree
        dateToTextField.layer.cornerRadius = 11
        dateToTextField.layer.borderWidth = 1

        dateFromTextField.layer.borderColor = UIColor.warmGrey.cgColor
        dateFromTextField.backgroundColor = .whiteThree
        dateFromTextField.layer.cornerRadius = 11
        dateFromTextField.layer.borderWidth = 1

        dateFromLabel.font = .textStyle6
        dateToLabel.textColor = .darkGray
        dateToLabel.font = .textStyle6
        dateFromLabel.textColor = .darkGray
        
        filterView.isHidden = true

    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "JogsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "JogsTableViewCell")
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
            showFilterView(view: filterView, hidden: false)
            filterMenuState = .active
        case .active:
            
            filterViewHeightConstraint.constant = 0
            showFilterView(view: filterView, hidden: true)
            filterMenuState = .unactive
        }
    }
    
    private func showFilterView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }
    
    @IBAction func didTappedFilterButton(_ sender: UIButton) {
        filterButtonStateChanged()
        filterViewStateChanged()
    }
}

//MARK: - Extensions
extension JogsScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JogsScreenViewController.tableViewCellData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JogsTableViewCell" , for: indexPath) as! JogsTableViewCell
        let data = JogsScreenViewController.tableViewCellData[indexPath.row]
        
        guard let distanse = Int(data.distanse), let time = Int(data.time) else { return cell }
        
        let timeHours: Double = Double(time) / 60
        let speed = ( Double(distanse) / timeHours)

        cell.dateLabel.text = "\(data.date)"
        cell.distanceLabel.text = "Distance: "+"\(distanse) km"
        cell.timeLabel.text = "Time: "+"\(time) min"
        cell.speedLabel.text = "Speed: "+"\(Int(speed)) km / h"
        
        cell.imgView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 66).isActive = true
        cell.imgView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        cell.stackView.spacing = 10.0
        cell.stackView.leadingAnchor.constraint(equalTo: cell.imgView.trailingAnchor, constant: 50).isActive = true
        cell.stackView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        return cell
    }
}

extension JogsScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 187
    }
}

extension Date {
    func days(to secondDate: Date, calendar: Calendar = Calendar.current) -> Int {
        return calendar.dateComponents([.day], from: self, to: secondDate).day! // Здесь force unwrap, так как в компонентах указали .day и берем day
    }
}
