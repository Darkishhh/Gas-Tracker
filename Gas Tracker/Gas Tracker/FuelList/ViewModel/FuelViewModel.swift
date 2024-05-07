//
//  FuelViewModel.swift
//  Gas Tracker
//
//  Created by Dmytro Ryshchuk on 5/5/24.
//

import Foundation

class FuelViewModel {
    var vehicle: Vehicle?
    
    func getVehicle(_ vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    init(for vehicle: Vehicle? = nil) {
        self.vehicle = vehicle
    }
}
