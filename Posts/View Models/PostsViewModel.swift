//
//  PostsViewModel.swift
//  Posts
//
//  Created by Tiago Henriques on 29/08/2021.
//

import Foundation
import SwiftUI
import Combine

class PostsViewModel: ObservableObject {
    @Published private(set) var posts: [Post] = []
    private let networker: Networking
    private var cancellables: Set<AnyCancellable> = []
  
    init(networker: Networking) {
        self.networker = networker
    }

    func fetchPosts() {    
        networker.fetch(url: API.postsURL)
            .replaceError(with: [])
            .assign(to: \.posts, on: self)
            .store(in: &cancellables)
    }
}
