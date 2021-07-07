//
//  UserViewModelTest.swift
//  Test1Tests
//
//  Created by Pushpank Kumar on 02/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import XCTest
@testable import Test1

class UserViewModelTest: XCTestCase {
    
    var userViewModel: UserViewModel!
    
    override func setUp() {
        userViewModel = UserViewModel(userDataModel: User(id: 23, name: "Demo", username: "demoTest", phone: "7017986113", website: "swiftygolum.com", company: Company(name: "Google"), address: Address(street: "Akshya Nagar 1st Block 1st Cross", suite: "Rammurthy nagar", city: "Bangalore", zipcode: "560016", geo: Geo(lat: "13.011140", lng: "77.670837"))))
    }
    
    override func tearDown() {
        userViewModel = nil
    }
    
    func testSuccess_Name() {
        XCTAssertEqual(userViewModel.name, "Demo")
    }
    
    func testFailure_Name() {
        XCTAssertNotEqual(userViewModel.name, "Demo1")
    }
    
    func testSuccess_Company() {
        XCTAssertEqual(userViewModel.companyName, "Google")
    }
    
    func testFailure_Company() {
        XCTAssertNotEqual(userViewModel.name, "Google1")
    }
    
    func testSuccess_Website() {
        XCTAssertEqual(userViewModel.website, "swiftygolum.com")
    }
    
    func testFailure_Website() {
        XCTAssertNotEqual(userViewModel.website, "swiftygolum.com.")
    }
    
    func testSuccess_PhoneNumber() {
        XCTAssertEqual(userViewModel.phoneNumber, "7017986113")
    }
    
    func testFailure_PhoneNumber() {
        XCTAssertNotEqual(userViewModel.phoneNumber, "7017986112")
    }
    
    func testSuccess_Username() {
        XCTAssertEqual(userViewModel.username, "demoTest")
    }
    
    func testFailure_Username() {
        XCTAssertNotEqual(userViewModel.username, "demoTest11")
    }
    
    func testSuccess_Address() {
        XCTAssertEqual(userViewModel.address, "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore, 560016")
    }
    
    func testFailure_Address() {
        XCTAssertNotEqual(userViewModel.address, "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore, 435456")
    }
}

