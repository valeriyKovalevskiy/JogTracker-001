//
//  UIDevice+Ext.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/10/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import UIKit

extension UIDevice {

    static let iPhone4orLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength < 568.0
    static let iPhone5orSE = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 568.0
    static let iPhone5orSEorLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength <= 568.0
    static let iPhone678 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let iPhone678orMore = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength >= 667.0
    static let iPhone678p = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let iPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 812.0
    static let iPhoneXRorMore = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength >= 812.0
    
    struct ScreenSize {
        static let width = UIScreen.main.bounds.size.width
        static let height = UIScreen.main.bounds.size.height
        static let maxLength = max(ScreenSize.width, ScreenSize.height)
        static let minLength = min(ScreenSize.width, ScreenSize.height)
        static let frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
    }
}

