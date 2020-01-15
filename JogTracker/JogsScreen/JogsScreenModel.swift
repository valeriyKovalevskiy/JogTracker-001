//
//  JogsScreenModel.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/15/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import Foundation
import UIKit


enum ActivityState {
    case active
    case unactive
}

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
