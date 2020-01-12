//
//  UserDefaults.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/12/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import Foundation

class UserDefault {
    
    static var defaults = UserDefaults.standard
    
    static func setBool(_ bool: Bool, key: Keys) {
        defaults.set(bool, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    static func getBool(_ key: Keys) -> Bool  {
        let value = defaults.bool(forKey: key.rawValue)
        return value
    }
    
    static func setInt(_ int: Int, key: Keys) {
        defaults.set(int, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    static func getInt(_ key: Keys) -> Int {
        let value = defaults.integer(forKey: key.rawValue)
        return value
    }
    
    enum Keys: String {
        case isMenuOpen = "menuIsOpen"
        case tableViewContainsData = "tableViewContainsData"
        case isTableViewController = "isTableViewController"
        case isLoggedIn = "isLoggedIn"
    }
    
}
