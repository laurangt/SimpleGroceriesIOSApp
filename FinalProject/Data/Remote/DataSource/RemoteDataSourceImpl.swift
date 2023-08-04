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
    private let server: String = "https://edamam-recipe-search.p.rapidapi.com/search"
        
    func getRecipes(query: String) async throws -> [RecipeModel]?{
        guard let url = URL(string: "\(server)?q=\(query)") else {
            throw NetworkError.malformedURL
        }

        // URL request
        var urlRequest = URLRequest(url: url)
        print(
            urlRequest.description
        )
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("b1709d4d0dmsh68fa8db1532279ep1d532djsn4dd769eb03ca", forHTTPHeaderField: "X-RapidAPI-Key")


        // Obetener la data de la llamada
        do {
            let (data, response) = try await session.data(for: urlRequest)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            let decodedData = try JSONDecoder().decode(RecipeResultModel.self, from: data)
            print(decodedData)
            return decodedData.hits
        } catch (let error){
            print(error)
            return []
        }
        
    }
    
}



