//
//  UserViewModel.swift
//  Test1
//
//  Created by Pushpank Kumar on 02/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import Foundation

class UserViewModel {
    
    private let userDataModel: User
    
    init(userDataModel: User) {
        self.userDataModel = userDataModel
    }
    
    public var name: String {
        return userDataModel.name ?? ""
    }
    
    public var website: String {
        return userDataModel.website ?? ""
    }
    
    public var phoneNumber: String {
        return userDataModel.phone ?? ""
    }
    
    public var companyName: String {
        return userDataModel.company?.name ?? ""
    }
    
    public var username: String {
        return userDataModel.username ?? ""
    }
    
    public var address: String {
        var add = ""
        if let street = userDataModel.address?.street {
            add += "\(street), "
        }
        
        if let suite = userDataModel.address?.suite {
            add += "\(suite), "
        }
        
        if let city = userDataModel.address?.city {
            add += "\(city), "
        }
        
        if let zipcode = userDataModel.address?.zipcode {
            add += "\(zipcode)"
        }
        return add
    }
    
    public var isFavorite: Bool = false

}

