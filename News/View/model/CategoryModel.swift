//
//  CategoryModel.swift
//  News
//
//  Created by Patryk Dampc on 26/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import Foundation

struct CategoryModel: Identifiable{
    let id = UUID()
    let category: ApiService.Category
    let name: String
}

