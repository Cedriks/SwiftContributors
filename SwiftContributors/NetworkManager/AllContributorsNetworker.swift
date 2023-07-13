//
//  AllContributorsNetworker.swift
//  SwiftContributors
//
//  Created by Cedrik on 13/07/2023.
//

import Foundation

protocol AllContributorsNetworking {
    func fetchAllContributors() async throws -> [Contributor]
}

final class AllContributorsNetworker: AllContributorsNetworking {
    private let netWorker: NetworkWorkerProtocol
    private let urlSession: URLSession
    
    init(netWorker: NetworkWorkerProtocol = NetworkWorker(), urlSession: URLSession = .shared) {
        self.netWorker = netWorker
        self.urlSession = urlSession
    }
    
    func fetchAllContributors() async throws -> [Contributor] {
        var contributors = [Contributor]()
        
        guard let url: URL = try? netWorker.makeURL() else {
            throw NetworkerError.invalidURL
        }
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let items = try JSONDecoder().decode([Contributor].self, from: data)
            contributors = items
        } catch {
            print("Fetching \(url.absoluteString)...")
            throw NetworkerError.dataRecoveryFailure
        }
        return contributors
    }
}

