//
//  MoviesView.swift
//  Breaking Bad Wiki
//
//  Created by Patryk Dampc on 19/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                articles(articles: viewModel.articles, topOffset: 200).layoutPriority(1)
                header(categories: viewModel.categories)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
    }
    
    func articles(articles: [Article],topOffset: CGFloat) -> some View {
        GeometryReader { rootGeometry in
            ScrollView(.vertical) {
                ForEach(viewModel.articles) { item in
                    ArticleHeaderTile(article: item, parentFrame: rootGeometry.frame(in: .global), topOffset: topOffset)
                }
                .padding(.top,topOffset)
            }
        }
    }
    
    func header(categories: [CategoryModel]) -> some View {
        GeometryReader { geometry in
            VStack{
                VStack{
                    HStack{
                        Text("News")
                            .font(.system(size: 40, weight: Font.Weight.regular, design: .default))
                            .padding(.top,geometry.safeAreaInsets.top)
                            .padding()
                        Spacer()
                    }
                    VerticalCarousel(items: viewModel.categories) { category in
                        Text(category.name)
                            .font(.system(size: 20, design: .default))
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color.blue)
                    }
                    .layoutPriority(1)
                }
                .background(Blur(style: .regular))
                .edgesIgnoringSafeArea(.top)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
