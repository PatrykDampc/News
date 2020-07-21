//
//  MovieViewModel.swift
//  Breaking Bad Wiki
//
//  Created by Patryk Dampc on 19/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    let api = Api()
    
    @Published var characters: [Article] = []
    var cancellationToken: AnyCancellable?
    
    init() {
        getMovies()
    }
    
    func getMovies() {
        cancellationToken = api.getTopHeadlines()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.characters = $0.articles
            })
    }
    
}

