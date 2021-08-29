//
//  PostRow.swift
//  Posts
//
//  Created by Tiago Henriques on 29/08/2021.
//

import Foundation
import SwiftUI

struct PostRow: View {
    let post: Post

    init(post: Post) {
        self.post = post
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(post.name).bold()
                Spacer()
                Text(post.publishedAt)
                    .foregroundColor(Color.gray)
            }
            Text(post.summary)
        }
        .padding()
    }
}

struct PostRow_Previews: PreviewProvider {
    static let post = Post(
        id: 0,
        name: "Carrots",
        summary: "A scalable and easy to use HTTP client written in Swift",
        publishedAt: "2021-03-07",
        githubUrl: "https://github.com/henriquestiagoo/Carrots"
    )
    
    static var previews: some View {
        Group {
            PostRow(post: post)
                .previewLayout(.fixed(width: 300, height: 100))
        }
    }
}
