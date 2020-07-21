//
//  ApiClient.swift
//  Breaking Bad Wiki
//
//  Created by Patryk Dampc on 19/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import Foundation
import Combine

class ApiClient {
    
     let baseUrl = URL(string: "https://newsapi.org/v2/")!
    
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func request<T: Decodable>(for path: String) -> AnyPublisher<Response<T>, Error> {
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        
        components.queryItems = [
           URLQueryItem(name: "apiKey", value: "949ebb09cdf940f79df81fa9fc94f831"),
           URLQueryItem(name: "country", value: "us")
        ]
        
        let request = URLRequest(url: components.url!)
        
        print("URL: \(components.url)")
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
}

