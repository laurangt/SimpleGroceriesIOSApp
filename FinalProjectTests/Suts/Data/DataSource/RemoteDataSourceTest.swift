//
//  RemoteDataSourceTest.swift
//  FinalProjectTests
//
//  Created by Nguyen-Trong Laura on 7/8/23.
//

import XCTest
@testable import FinalProject

final class RemoteDataSourceTest: XCTestCase {

    var sut: RemoteDataSourceProtocol?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRemoteDataSource_whenFetchingApi_expectRecipes() async throws{
        do {
            let recipes = try await sut?.getRecipes(query: "")
            XCTAssertTrue([recipes].count > 0)
        } catch {
            throw error
        }
    }
}
