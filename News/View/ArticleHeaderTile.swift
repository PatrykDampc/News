//
//  ArticleHeaderTile.swift
//  News
//
//  Created by Patryk Dampc on 26/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import SwiftUI

struct ArticleHeaderTile: View {
    var article: Article
    var parentFrame: CGRect
    var topOffset: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            tileContent()
                .frame(maxWidth: parentFrame.width,minHeight: geo.size.height )
                .background(Color.blue)
                .cornerRadius(10)
                .padding(10)
                .shadow(radius: 10)
                .rotation3DEffect(
                    .degrees(
                        calculateRotationDegree(
                            for: geo.frame(in: .global),
                            root: parentFrame,
                            topOffset: topOffset
                        )
                    ),
                    axis: (x: 1, y: 0, z: 0),
                    anchor: UnitPoint.bottom
                )
        }
        .frame(minWidth: parentFrame.width, minHeight: tileHeight)
        
    }
    
    private func tileContent() -> some View {
        Text(article.title)
            .font(.title)
            .foregroundColor(.white)
    }
    
   private func calculateRotationDegree(for position: CGRect, root: CGRect, topOffset: CGFloat) -> Double {
        if position.minY < root.minY + topOffset {
            let calculatedFromPosition = abs(Double(0 - ((root.minY + topOffset) - position.minY))) * 0.2
            if calculatedFromPosition < 90 {
                return calculatedFromPosition
            } else{
                return 90
            }
        } else {
            return 0
        }
    }
    
    let tileHeight = CGFloat(200)
}


struct ArticleHeaderTile_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ArticleHeaderTile(
                article: Article(
                    id: UUID(),
                    title: "Test title",
                    source: Article.Source(id: nil, name: "f"),
                    author: nil,
                    description: "fedsa",
                    url: "Fsdf",
                    imageUrl: nil,
                    content: nil
                ),
                parentFrame: geometry.frame(in: .global),
                topOffset: CGFloat(200)
            )
            .frame(height: 200)
            .padding(.top,200)
        }
    }
}
