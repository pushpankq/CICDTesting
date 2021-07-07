//
//  DashbordViewModel.swift
//  Test1
//
//  Created by Pushpank Kumar on 01/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import Foundation

typealias StatusCompletion = (Bool, String?) -> Void

class DashbordViewModel {
    
    let dashbordServiceHandler: DashbordServiceHandler
    var userListViewModel = [UserViewModel]()
    
    init(dashbordServiceHandler: DashbordServiceHandler = DashbordServiceHandler()) {
        self.dashbordServiceHandler = dashbordServiceHandler
    }
    
    func getUsers(withCompletionHandler completion: @escaping StatusCompletion) {
        dashbordServiceHandler.getUsers { (user, error) in
            
            if let error = error {
                completion(false, error)
            } else {
                if let user = user {
                    let users = user.map(UserViewModel.init)
                    self.userListViewModel = users
                    completion(true, nil)
                } else {
                    completion(false, "Something went wrong")
                }
            }
        }
    }
    
    func getNumberOfCells(_ section: Int) -> Int {
        return self.userListViewModel.count
    }
    
    func getNumberOfSections() -> Int {
        return 1
    }
}
