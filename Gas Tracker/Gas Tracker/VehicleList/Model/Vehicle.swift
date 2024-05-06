//
//  Vehicle.swift
//  Gas Tracker
//
//  Created by Dmytro Ryshchuk on 5/5/24.
//

import Foundation

struct Vehicle {
    let name: String
    let image: String? // add later stock image
    let mileage: Int
    let id: String
    let history: [FuelPurchase]?
}
