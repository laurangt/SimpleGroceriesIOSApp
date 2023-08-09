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
    
    private let session: NetworkFetchingProtocol
        
    init(session: NetworkFetchingProtocol = URLSession.shared){
        self.session = session
    }
    
    func getRecipes(query: String) async throws -> [RecipeModel]?{
        let server: String = "https://api.edamam.com/api/recipes/v2?type=public&q=\(query)&app_id=c6d3b936&app_key=d2bbffebefefdb3b3a52cca3845e91a4"

        guard let url = URL(string: "\(server)") else {
            throw NetworkError.malformedURL
        }

        // URL request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        print(
            urlRequest.description
        )

        // Obetener la data de la llamada

        let (data, response) = try await session.data(url: urlRequest)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
    
        let decodedData = try JSONDecoder().decode(RecipeResultModel.self, from: data)
        return decodedData.hits

    }
}



