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
                headers(articles: viewModel.articles, topOffset: 200).layoutPriority(1)
                categoriesView(categories: viewModel.categories)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
    }
    
    func headers(articles: [Article],topOffset: CGFloat) -> some View {
        GeometryReader { rootGeometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: [
                    GridItem(.fixed(rootGeometry.size.width/2)),
                    GridItem(.fixed(rootGeometry.size.width/2))
                ]) {
                    
                    
                    ForEach(viewModel.articles) { item in
                        
                        articleHeaderView(article: item, rootFrame: rootGeometry.frame(in: .global))
                        
                    }
                    .padding(.top,topOffset)
                    
                }
            }
        }
    }
    
    func articleHeaderView(article: Article, rootFrame: CGRect) -> some View {
        GeometryReader { geo in
            Text(article.title)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .rotation3DEffect(
                    .degrees(
                        calculateRotationDegree(
                            for: geo.frame(in: .global),
                            root: rootFrame,
                            offset: CGFloat(200)
                        )
                    ),
                    axis: (x: 1, y: 0, z: 0),
                    anchor: UnitPoint.bottom
                )
        }
    }
    
    func calculateRotationDegree(for position: CGRect, root: CGRect, offset: CGFloat) -> Double {
        if position.minY < root.minY + offset {
            let calculatedFromPosition = abs(Double(0 - ((root.minY + offset) - position.minY))) * 0.3
            if calculatedFromPosition < 90 {
                return calculatedFromPosition
            } else{
                return 90
            }
        } else {
            return 0
        }
    }
    
    func categoriesView(categories: [CategoryModel]) -> some View {
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
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(categories) { category in
                                Text(category.name)
                                    .font(.system(size: 20, design: .default))
                                    .foregroundColor(Color.white)
                                    .padding(10)
                                    .background(Color.blue)
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding()
                        
                    }.layoutPriority(1)
                }
                .background(Blur(style: .regular))
                .edgesIgnoringSafeArea(.top)
                Spacer()
            }
        }
    }
    
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Home()
    }
}
