//
//  JogsTableViewCell.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/13/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.


import UIKit

class JogsTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
