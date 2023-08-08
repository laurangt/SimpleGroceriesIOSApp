//
//  GroceryModelTests.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import XCTest
@testable import FinalProject

final class GroceryModelTests: XCTestCase {

    var sut: GroceryModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRemoteDataSource_whenFetchingApi_expectRecipes() {
        
    }

}
