//
//  DashbordServiceHandler.swift
//  Test1
//
//  Created by Pushpank Kumar on 01/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import Foundation

class DashbordServiceHandler {
    
    func getUsers(withCompletionHandler completion: @escaping ([User]?, String?) -> Void) {
        
        let urlString = ApiEndPoint.baseUrl
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .success(let data):
                do {
                    let user = try JSONDecoder().decode([User].self, from: data)
                    debugPrint("user", user)
                    completion(user, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
