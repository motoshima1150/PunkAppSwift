//
//  APIService.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/14.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation
import Combine

protocol APIServiceType {
    func response<T>(from request: T) -> AnyPublisher<T.Response, APIServiceError> where T: Request
}

final class APIService: APIServiceType {
    
    private let session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func response<T>(from request: T) -> AnyPublisher<T.Response, APIServiceError> where T: Request {
    
        guard let pathURL = URL(string: request.path, relativeTo: request.baseURL),
            var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true) else {
            return AnyPublisher(Fail(error: APIServiceError.requestError))
        }
        
        urlComponents.queryItems = request.queryItems
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decorder = JSONDecoder()
        decorder.keyDecodingStrategy = .convertFromSnakeCase
        return session.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: T.Response.self, decoder: decorder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
