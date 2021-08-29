//
//  Networker.swift
//  Posts
//
//  Created by Tiago Henriques on 29/08/2021.
//

import Foundation
import Combine

protocol Networking {
    func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, Error>
}

class Networker: Networking {
    func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
