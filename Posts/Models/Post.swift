//
//  Post.swift
//  Posts
//
//  Created by Tiago Henriques on 29/08/2021.
//

import Foundation
import UIKit

struct Post: Codable {
    let id: Int
    let name: String
    let summary: String
    let publishedAt: String
    let githubUrl: String
}

extension Post {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case summary
        case publishedAt = "published_at"
        case githubUrl = "github_url"
    }
}
