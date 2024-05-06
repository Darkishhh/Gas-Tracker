//
//  FuelList.swift
//  Gas Tracker
//
//  Created by Dmytro Ryshchuk on 5/5/24.
//

import UIKit

class FuelList: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var vehicleImage: UIImageView!
    @IBOutlet private weak var vehicleName: UILabel!
    @IBOutlet private weak var vehicleMileage: UILabel!
    
    var viewModel = FuelViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        guard let vehicle = viewModel.vehicle else { return }
        setupVehicleImage(with: vehicle.image)
        vehicleName.text = vehicle.name
        vehicleMileage.text = "\(vehicle.mileage)"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupVehicleImage(with name: String?) {
        guard let name else {
            vehicleImage.isHidden = true
            return
        }
        vehicleImage.image = UIImage(named: name)
    }
    
    private func showNoFuelIcon() {
        let noFuelImage = UIImageView(image: UIImage(named: "nofuel"))
        tableView.addSubview(noFuelImage)
        noFuelImage.translatesAutoresizingMaskIntoConstraints = false
        noFuelImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        noFuelImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
}

extension FuelList: UITableViewDelegate {
    
}

extension FuelList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let amount = viewModel.vehicle?.history?.count else {
            showNoFuelIcon()
            return 0
        }
        return amount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fuelCell", for: indexPath) as? FuelTVC
        guard let cell else { return UITableViewCell() }
        cell.setupCell(with: viewModel.vehicle?.history?[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(116.0)
    }
}
