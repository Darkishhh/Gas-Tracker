//
//  VehicleTVC.swift
//  Gas Tracker
//
//  Created by Dmytro Ryshchuk on 5/5/24.
//

import UIKit

class VehicleTVC: UITableViewCell {
    
    @IBOutlet private weak var vehicleImage: UIImageView!
    @IBOutlet private weak var vehicleName: UILabel!
    @IBOutlet private weak var vehicleMileage: UILabel!

    override func prepareForReuse() {
        vehicleImage.isHidden = false
    }
    
    func setupCell(with vehicle: Vehicle) {
        vehicleName.text = vehicle.name
        vehicleMileage.text = "\(vehicle.mileage)"
        setupVehicleImage(with: vehicle.image)
    }
    
    private func setupVehicleImage(with name: String?) {
        guard let name else {
            vehicleImage.isHidden = true
            return
        }
        vehicleImage.image = UIImage(named: name)
    }
}
