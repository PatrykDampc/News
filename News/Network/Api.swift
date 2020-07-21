//
//  Api.swift
//  Breaking Bad Wiki
//
//  Created by Patryk Dampc on 20/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import Foundation
import Combine

class Api {
    
    let client = ApiClient()
    
    func getTopHeadlines() -> AnyPublisher<Articles, Error> {
        client.request(for: "top-headlines")
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
}
