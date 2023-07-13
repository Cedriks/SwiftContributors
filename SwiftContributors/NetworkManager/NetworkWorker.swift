//
//  NetworkWorker.swift
//  SwiftContributors
//
//  Created by Cedrik on 13/07/2023.
//

import Foundation

protocol NetworkWorkerProtocol {
    func makeURL() throws -> URL
}

final class NetworkWorker: NetworkWorkerProtocol {
    private let rootUrl: String
    
    init(rooUrl: String = url) {
        self.rootUrl = rooUrl
    }
    
    func makeURL() throws -> URL {
        
        guard let url = URL(string: rootUrl) else {
            print("Bad URL: \(rootUrl)")
            throw NetworkerError.invalidURL
        }
        return url
    }
}
