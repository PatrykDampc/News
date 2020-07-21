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
    
    enum CodingKeys: String, CodingKey {
           case title = "title"
       }
}
