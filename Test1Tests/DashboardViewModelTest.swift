//
//  DashboardViewModelTest.swift
//  Test1
//
//  Created by Pushpank Kumar on 01/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import XCTest
@testable import Test1

class DashboardViewModelTest: XCTestCase {
    
    var viewModel: DashbordViewModel!

    override func setUp() {
        viewModel = DashbordViewModel()
        viewModel.getUsers { (_, _) in
            // do nothing here...
        }
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
        print("TEARDOWN assetsVC Test ")
    }
    
    func testUserCount() {
        XCTAssertEqual(self.viewModel.userListViewModel.count, self.viewModel.getNumberOfCells(0), "users should be equal to number of cells")
    }
    
    func testNumberOfSection() {
        XCTAssertEqual(1, self.viewModel.getNumberOfSections(), "number of section should be 1")
    }
}
