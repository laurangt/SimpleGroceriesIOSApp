//
//  RecipesViewModelTests.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import XCTest
@testable import FinalProject

final class RecipesViewModelTests: XCTestCase {

    var sut: RecipesViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockRepository = MockRespository()
        
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        
    }

    func testRecipesViewModel_when_expect() throws {
        
    }


}
