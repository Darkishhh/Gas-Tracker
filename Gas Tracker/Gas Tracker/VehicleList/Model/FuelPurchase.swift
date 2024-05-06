//
//  FuelPurchase.swift
//  Gas Tracker
//
//  Created by Dmytro Ryshchuk on 5/5/24.
//

import Foundation

enum FuelType: String {
    case regular
    case mid
    case premium
    case diesel
    case e85
}

enum FuelBrand: String {
    case shell
    case costco
    case exxon
}

struct FuelPurchase {
    let time: Date
    let place: (long: Double, lat: Double)?
    let price: Double
    let amount: Double
    let brand: FuelBrand?
    let type: FuelType
    // calculate price per gallon
}
