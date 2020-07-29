//
//  ArticleView.swift
//  News
//
//  Created by Patryk Dampc on 28/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    var body: some View {
        NavigationView{
            Image("")
                
                .navigationTitle("article")
                .navigationBarTitleDisplayMode(.inline)
        }
        .background(
            Color.black
//            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.gray]), startPoint: .bottom, endPoint: .top).ignoresSafeArea()
        )
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
