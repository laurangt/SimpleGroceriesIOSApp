//
//  URLSession.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 8/8/23.
//

import Foundation

extension URLSession: NetworkFetchingProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: url)
    }
}
