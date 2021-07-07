//
//  DetailsViewModelTests.swift
//  Test1Tests
//
//  Created by Pushpank Kumar on 02/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import XCTest
@testable import Test1

class DetailsViewModelTests: XCTestCase {
    
    var detailsViewModel: DetailsViewModel!


    override func setUp() {
        detailsViewModel = DetailsViewModel()
    }

    override func tearDown() {
        detailsViewModel = nil
    }
    
    func testFavorite() {
        XCTAssertEqual(detailsViewModel.setFavoriteIcon(action: .buttonPressed), "star.fill")
        XCTAssertNotEqual(detailsViewModel.setFavoriteIcon(action: .show), "star.fill")
        XCTAssertNotEqual(detailsViewModel.setFavoriteIcon(), "star.fill")
    }
}
