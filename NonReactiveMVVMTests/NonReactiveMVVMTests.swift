//
//  NonReactiveMVVMTests.swift
//  NonReactiveMVVMTests
//
//  Created by Miguel Tomairo on 01/02/2021.
//  Copyright © 2021 Rapser. All rights reserved.
//

import XCTest
@testable import NonReactiveMVVM

class NonReactiveMVVMTests: XCTestCase {
    func testFriendCell_shouldDisplayCorrectFullName() {
        let friend = Friend(id: "", firstName: "Ian", lastName: "Keen", email: "", image_small: "", image_large: "", about: "")
        let viewModel = FriendCellViewModel(friend: friend, imageCache: MockImageCache())
        XCTAssertEqual(viewModel.fullName, "Miguel Tomairo")
    }
}
