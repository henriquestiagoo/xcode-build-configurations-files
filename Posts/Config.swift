//
//  Config.swift
//  Posts
//
//  Created by Tiago Henriques on 29/08/2021.
//

import Foundation

enum Config {
    static func stringValue(forKey key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String else {
            fatalError("Invalid value or undefined key")
        }
        return value
    }
}

enum API {
    static var baseURL: URL {
        return URL(string: "https://" + Config.stringValue(forKey: "API_BASE_URL"))!
    }
    
    static var postsURL: URL {
        return URL(string: "https://" + Config.stringValue(forKey: "API_BASE_URL") + "/api/posts")!
    }
}
