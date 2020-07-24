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
    
    let api = ApiService()
    
    @Published var articles: [Article] = [
//        Article(
//            id: UUID(), title: "ddddd", source: Article.Source(id: nil, name: "f"), author: nil, description: "fedsa", url: "Fsdf", imageUrl: nil, content: nil
//        )
    ]
    var categories: [CategoryModel] = mapCategories()
    
    private var headlinesCancellable: AnyCancellable?
    private var categoriesCancelable: AnyCancellable?
    
    init() {
        getHeadlines()
    }
    
    static func mapCategories() -> [CategoryModel] {
        return ApiService.Category.allCases.map { category in
            CategoryModel(category: category, name: categoryName(category: category))
        }
    }
    
    static func categoryName(category: ApiService.Category) -> String {
        switch category {
        case .business: return "Business"
        case .entertainment: return "Entertainment"
        case .general: return "General"
        case .health: return "Health"
        case .science :return "Science"
        case .sports: return "Sports"
        case .technology: return "Technology"
        }
    }
        
        func getHeadlines() {
            headlinesCancellable = api.getTopHeadlines()
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: { _ in },
                      receiveValue: {
                        self.articles = $0.articles
                })
        }
        
        
        
        
        
    }
    
    struct CategoryModel: Identifiable{
        let id = UUID()
        let category: ApiService.Category
        let name: String
}


