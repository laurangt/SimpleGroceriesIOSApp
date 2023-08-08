//
//  NetworkFetchingProtocol.swift
//  FinalProject
//
//  Created by Nguyen-Trong Laura on 8/8/23.
//

import Foundation

protocol NetworkFetchingProtocol {
    func data(url: URLRequest) async throws  -> (Data, URLResponse)
}
