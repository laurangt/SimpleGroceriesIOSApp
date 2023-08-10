//
//  RemoteDataSourceProtocol.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 3/8/23.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func getRecipes(query: String) async throws -> [RecipeModel]?
}
