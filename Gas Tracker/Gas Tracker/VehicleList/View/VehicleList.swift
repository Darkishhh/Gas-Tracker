//
//  VehicleList.swift
//  Gas Tracker
//
//  Created by Dmytro Ryshchuk on 5/5/24.
//

import UIKit

class VehicleList: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel = VehicleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetup()
        tableView.reloadData()
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension VehicleList: UITableViewDelegate {
    
}

extension VehicleList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.myVehiclesList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath) as? VehicleTVC
        guard let cell else { return UITableViewCell() }
        cell.setupCell(with: viewModel.myVehiclesList()[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "fuelList") as? FuelList {
            viewController.viewModel.vehicle = viewModel.myVehiclesList()[indexPath.row]
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.myVehiclesList()[indexPath.row].image != nil ? CGFloat(116.0) : CGFloat(80.0)
    }
}

