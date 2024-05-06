//
//  VehicleViewModel.swift
//  Gas Tracker
//
//  Created by Dmytro Ryshchuk on 5/5/24.
//

import Foundation

class VehicleViewModel {
    private var vehicles = [Vehicle]() // update it for mock data
    
    func myVehiclesList() -> [Vehicle] {
        let kia = Vehicle(name: "Kia Sorento", image: "Kia.PNG", mileage: 171_150, id: "1", history: firstFuelPurchase())
        let chevy = Vehicle(name: "Chevrolet Cruze", image: nil, mileage: 80_000, id: "2", history: moreFuelPurchases())
        let porsh = Vehicle(name: "Porsche Boxster", image: "Boxster.PNG", mileage: 190_000, id: "3", history: nil)
        
        return [kia, chevy, porsh]
    }
    
    private func fuelPurchase(time: TimeInterval, place: (long: Double, lat: Double),
                              price: Double, amount: Double,
                              brand: FuelBrand, fuelType: FuelType) -> [FuelPurchase] {
        return [FuelPurchase(time: Date(timeIntervalSince1970: time),
                             place: place,
                             price: price,
                             amount: amount,
                             brand: brand,
                             type: fuelType)]
    }
    
    private func firstFuelPurchase() -> [FuelPurchase] {
        fuelPurchase(time: 1714922400, place: (long: 30.536690434034494, lat:  -97.69375830913314),
                     price: 55.65, amount: 14.3,
                     brand: .shell, fuelType: .premium)
    }
    
    private func moreFuelPurchases() -> [FuelPurchase] {
        var purchases = firstFuelPurchase()
        purchases += fuelPurchase(time: 1714712400, place: (long: 30.52692592964658, lat: -97.8176160734298), price: 49.12, amount: 13.1, brand: .costco, fuelType: .premium)
        purchases += fuelPurchase(time: 1714112400, place: (long: 30.508770139167112, lat: -97.77453154392992), price: 31.99, amount: 8.7, brand: .exxon, fuelType: .mid)
        return purchases
    }
}
