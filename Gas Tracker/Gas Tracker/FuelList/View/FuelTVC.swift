//
//  FuelTVC.swift
//  Gas Tracker
//
//  Created by Dmytro Ryshchuk on 5/5/24.
//

import UIKit
import MapKit

class FuelTVC: UITableViewCell {
    
    @IBOutlet private weak var purchaseDate: UILabel!
    @IBOutlet private weak var purchasePrice: UILabel!
    @IBOutlet private weak var purchaseAmount: UILabel!
    @IBOutlet private weak var purchaseType: UILabel!
    @IBOutlet private weak var purchaseBrand: UIImageView!
    @IBOutlet private weak var purchasePlace: MKMapView!
    
    override func prepareForReuse() {
        purchaseBrand.isHidden = false
    }
    
    func setupCell(with purchase: FuelPurchase?) {
        guard let purchase = purchase else { return }
        purchaseDate.text = purchase.time.description
        purchasePrice.text = "$\(purchase.price)"
        purchaseAmount.text = "Gal: \(purchase.amount)"
        purchaseType.text = purchase.type.rawValue
        
        setupBrandImage(with: purchase.brand)
        setupMap(with: purchase.place)
    }
    
    private func setupBrandImage(with brand: FuelBrand?) {
        guard let brand else {
            purchaseBrand.isHidden = true
            return
        }
        purchaseBrand.image = UIImage(named: brand.rawValue)
    }
    
    private func setupMap(with place: (long: Double, lat: Double)?) {
        guard let place else { return }
        
        let center = CLLocationCoordinate2D(latitude: place.long, longitude: place.lat)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 200, longitudinalMeters: 200)
        purchasePlace.translatesAutoresizingMaskIntoConstraints = false
        purchasePlace.setRegion(region, animated: false)
    }

}
