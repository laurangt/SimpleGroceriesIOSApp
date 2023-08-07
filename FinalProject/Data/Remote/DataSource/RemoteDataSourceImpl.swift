//
//  RemoteDataSourceImpl.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 3/8/23.
//

import Foundation

enum NetworkError: Error, Equatable {
    case invalidData
    case noData
    case invalidResponse
    case malformedURL
}

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    private let session = URLSession.shared
    private let server: String = "https://api.edamam.com/api/recipes/v2?type=public&q=pasta&app_id=c6d3b936&app_key=d2bbffebefefdb3b3a52cca3845e91a4"
        
    func getRecipes(query: String) async throws -> [RecipeModel]?{
        guard let url = URL(string: "\(server)") else {
            throw NetworkError.malformedURL
        }

        // URL request
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
//        urlRequest.setValue("d2bbffebefefdb3b3a52cca3845e91a4", forHTTPHeaderField: "app_key")
//        urlRequest.setValue("c6d3b936", forHTTPHeaderField: "app_id")
//        print(
//            urlRequest.description
//        )

        // Obetener la data de la llamada
        do {
            let (data, response) = try await session.data(for: urlRequest)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            let decodedData = try JSONDecoder().decode(RecipeResultModel.self, from: data)
//            print(decodedData)
            return decodedData.hits
        } catch (let error){
            print(error)
            return []
        }
    }
}



