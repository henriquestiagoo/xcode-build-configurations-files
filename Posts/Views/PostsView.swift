//
//  PostsView.swift
//  Posts
//
//  Created by Tiago Henriques on 29/08/2021.
//

import SwiftUI

struct PostsView: View {
    // Dependency injection and dependency inversion are key principles to make your class more decoupled from its dependencies and to make it testable.
    @ObservedObject private var viewModel = PostsViewModel(networker: Networker())
    @Environment(\.openURL) var openURL

    var body: some View {
        NavigationView {
            List(viewModel.posts, id: \.id) { post in
                PostRow(post: post)
                    .onTapGesture {
                        openGithubUrl(post: post)
                    }
            }
            .navigationBarTitle("Posts")
            .onAppear(perform: viewModel.fetchPosts)
        }
    }
    
    func openGithubUrl(post: Post) {
        guard let url = URL(string: post.githubUrl) else { return }
        openURL(url)
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
