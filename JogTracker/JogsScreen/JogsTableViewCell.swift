//
//  JogsTableViewCell.swift
//  JogTracker
//
//  Created by валерий on 1/13/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.


import UIKit

class JogsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    
    // MARK: - Initialization and config
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCell()
    }
    
    private func configCell() {
//delegates? take data from addnew selection
    }
}
