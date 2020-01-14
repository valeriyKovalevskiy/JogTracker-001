//
//  User.swift
//  JogTracker
//
//  Created by Valeriy Kovalevskiy on 1/14/20.
//  Copyright © 2020 ValeriyKovalevskiy. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: String
    let username: String
    let password: String
    let age: Int
}
