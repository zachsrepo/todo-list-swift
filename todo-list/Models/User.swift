//
//  User.swift
//  todo-list
//
//  Created by Zachary Tumbusch on 7/2/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
