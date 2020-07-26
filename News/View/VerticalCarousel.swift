//
//  VerticalCarousel.swift
//  News
//
//  Created by Patryk Dampc on 26/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import SwiftUI

struct VerticalCarousel<ItemView, Item>: View where ItemView: View, Item: Identifiable {
    var items: [Item]
    var content: (Item) -> ItemView
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(items) { item in
                    content(item)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
            }
            .padding()
            
        }
    }
}

struct VerticalCarousel_Previews: PreviewProvider {
    static var previews: some View {
        VerticalCarousel(
            items: [
                CategoryModel(category: ApiService.Category.business, name: "Business"),
                CategoryModel(category: ApiService.Category.general, name: "General"),
            ], content: {
                Text($0.name)
                    .font(.system(size: 20, design: .default))
                    .foregroundColor(Color.white)
                    .padding(10)
                    .background(Color.blue)
                
            }
        )
    }
}
