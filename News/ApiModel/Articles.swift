//
//  Movie.swift
//  Breaking Bad Wiki
//
//  Created by Patryk Dampc on 19/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import Foundation

struct Articles: Codable, Identifiable {
    var id = UUID()
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
}

struct Article: Codable, Identifiable {
    var id = UUID()
    let title: String
    let source: Source
    let author: String?
    let description: String?
    let url: String
    let imageUrl: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case source = "source"
        case author = "author"
        case description = "description"
        case url = "url"
        case imageUrl = "imageUrl"
        case content = "content"
    }
    
    struct Source:  Codable  {
        let id: String?
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
        }
    }
}
