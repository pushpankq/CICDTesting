//
//  DetailsViewModel.swift
//  Test1
//
//  Created by Pushpank Kumar on 02/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

enum Action {
    // If we are not changing the state
    case show
    // If we are updating the state
    case buttonPressed
}

class DetailsViewModel {
    
    var userViewModel: UserViewModel?
    var favoriteDateUpdateCallback: ((Bool) -> Void)?

    func setFavoriteIcon(action: Action = .show) -> String {
        var isFavorite = userViewModel?.isFavorite ?? false
        switch action {
        case .show:
            debugPrint("skip it")
        case .buttonPressed:
            isFavorite.toggle()
            favoriteDateUpdateCallback?(isFavorite)
        }
        let favoriteImageString = isFavorite ? ImageConstants.favorite : ImageConstants.unFavorite
        return favoriteImageString
    }
}
