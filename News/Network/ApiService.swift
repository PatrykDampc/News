//
//  Api.swift
//  Breaking Bad Wiki
//
//  Created by Patryk Dampc on 20/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import Foundation
import Combine

class ApiService {
    
    private let client = ApiClient()
    
    func getTopHeadlines() -> AnyPublisher<Articles, Error> {
        client.request(for: "top-headlines")
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func getHeadlines(for category: Category) -> AnyPublisher<Articles,Error> {
        client.request(for: "top-headlines",queryItems: URLQueryItem(name: "category", value: String(describing: category)))
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    enum Category: CaseIterable {
        case business,
        entertainment,
        general,
        health,
        science,
        sports,
        technology
        
    }
    
}
