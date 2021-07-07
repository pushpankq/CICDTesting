//
//  UserTableViewCell.swift
//  Test1
//
//  Created by Pushpank Kumar on 01/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var favoriteButtonCallback: (() -> Void)?
    
    @IBAction func favoriteButtonPressed() {
        favoriteButtonCallback?()
    }
}

extension UserTableViewCell {
    
    func configCell(withUser user: UserViewModel) {
        nameLabel.text = user.name
        phoneNumberLabel.text = user.phoneNumber
        websiteLabel.text = user.website
        companyNameLabel.text = user.companyName
        setFavoriteIcon(isFavorite: user.isFavorite)
    }
    
    func setFavoriteIcon(isFavorite: Bool) {
        let favoriteImageString = isFavorite ? ImageConstants.favorite : ImageConstants.unFavorite
        favoriteButton.setImage(UIImage(systemName: favoriteImageString), for: .normal)
    }
}
