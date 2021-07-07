//
//  DashbordModel.swift
//  Test1
//
//  Created by Pushpank Kumar on 01/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String?
    let username: String?
    let phone: String?
    let website: String?
    let company: Company?
    let address: Address?
}

struct Company: Codable {
    let name: String?
}

struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}


struct Geo: Codable {
    let lat: String?
    let lng: String?
}
