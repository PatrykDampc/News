//
//  MoviesView.swift
//  Breaking Bad Wiki
//
//  Created by Patryk Dampc on 19/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = .blue
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().shadowImage = UIImage()
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30,weight: UIFont.Weight.bold),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        
    }
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                articles(articles: viewModel.articles, topOffset: 100).layoutPriority(1)
                header(categories: viewModel.categories)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.gray]), startPoint: .bottom, endPoint: .top).ignoresSafeArea()
            )
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
    
    func articles(articles: [Article],topOffset: CGFloat) -> some View {
        GeometryReader { rootGeometry in
            ScrollView(.vertical,  showsIndicators: false) {
                ForEach(viewModel.articles) { item in
                    
                    NavigationLink(
                        destination: ArticleView()
                    ) {
                        
                        ArticleHeaderTile(
                            article: item,
                            parentFrame: rootGeometry.frame(in: .global),
                            topOffset: topOffset
                        )
                    }
                }
                .padding(.top,topOffset)
            }
        }
    }
    
    func header(categories: [CategoryModel]) -> some View {
        GeometryReader { geometry in
                VerticalCarousel(items: viewModel.categories) { category in
                    Text(category.name)
                        .font(.system(size: 20, design: .default))
                        .foregroundColor(Color.white)
                        .padding(10)
                        .background(Color.blue)
                }
                .padding(.top,geometry.safeAreaInsets.top)
                .background(Blur(style: .regular))
                .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
        }
    }
}
