//
//  DetailsViewController.swift
//  Test1
//
//  Created by Pushpank Kumar on 01/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var companyDetailsLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    let detailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = detailsViewModel.userViewModel?.name
        dataSetUp()
    }
    
    @IBAction func favoriteButtonPressed() {
        let systemImageName = detailsViewModel.setFavoriteIcon(action: .buttonPressed)
        favoriteButton.setImage(UIImage(systemName: systemImageName), for: .normal)
    }
}

//MARK:Private Methods
extension DetailsViewController {
    private func dataSetUp() {
        websiteLabel.text = detailsViewModel.userViewModel?.website
        phoneNumberLabel.text = detailsViewModel.userViewModel?.phoneNumber ?? ""
        companyDetailsLabel.text = detailsViewModel.userViewModel?.companyName ?? ""
        usernameLabel.text = detailsViewModel.userViewModel?.username
        let systemImageName = detailsViewModel.setFavoriteIcon()
        favoriteButton.setImage(UIImage(systemName: systemImageName), for: .normal)
        
        if let _ = detailsViewModel.userViewModel?.address {
            addressLabel.isHidden = false
            addressLabel.text = detailsViewModel.userViewModel?.address
        } else {
            addressLabel.isHidden = true
        }
    }
}
