//
//  ContributorsViewModel.swift
//  SwiftContributors
//
//  Created by Cedrik on 13/07/2023.
//

import Foundation

class ContributorsViewModel {
    
    private(set) var contributors = [Contributor]()
    private let allContributorsNetworker: AllContributorsNetworking
    
    init( allContributorsNetworker: AllContributorsNetworking = AllContributorsNetworker()) {
        self.allContributorsNetworker = allContributorsNetworker
    }
    
    func getAllContributors() async {
        do {
            self.contributors = try await allContributorsNetworker.fetchAllContributors()
            dump(self.contributors)
        } catch {
            print(error)
        }
    }
}
