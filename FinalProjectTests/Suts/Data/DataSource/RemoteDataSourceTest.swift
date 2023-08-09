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
    let recipeStub = RecipeStub()

    override func setUpWithError() throws {
        try super.setUpWithError()
        let URLSessionMock = NetworkFetchingMock()
        sut = RemoteDataSourceImpl(session: URLSessionMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRemoteDataSource_whenFetchingApi_expectRecipes() async throws {
        // GIVEN
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        // Inyectamos la configuración nuestra al mock
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImpl(session: mockURLSession)
        
        // Le metemos el request handler con status code y la data que queramos
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let recipes = [self.recipeStub.getStubRecipeRecipeModel()]
            let data = try JSONEncoder().encode(recipes)
            return (response, data)
        }
        
        // WHEN
        guard let recipes = try? await sut?.getRecipes(query: "pasta") else {
            XCTFail("Recipes must contain a recipe")
            return
        }
        
        // THEN
        XCTAssertNotNil(recipes.first)
        XCTAssertEqual(recipes.first?.recipe.label, "pasta")
    }
    
    
    func testRemoteDataSource_whenFetchingApiinvalidquery_expectNil() async throws {
        // GIVEN
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        // Inyectamos la configuración nuestra al mock
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImpl(session: mockURLSession)
        
        // Le metemos el request handler con status code y la data que queramos
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 400, httpVersion: nil, headerFields: nil)!
            let recipes = [self.recipeStub.getStubRecipeRecipeModel()]
            let data = try JSONEncoder().encode(recipes)
            return (response, data)
        }
        
        // WHEN
        guard let recipes = try? await sut?.getRecipes(query: "invalid query") else {
            XCTFail("Recipes should not be able to be fetched with invalid query")
            return
        }
        
        // THEN
        XCTAssertEqual(recipes.count, 0)

    }
}


// URL session rpotocol not api
