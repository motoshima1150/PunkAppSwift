//
//  BeersRequest.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/14.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation

final class BeersRequest: Request {
    typealias Response = [Beer]
    
    var baseURL: URL { URL(string: "https://api.punkapi.com/v2")! }
    var path: String { "/beers/" }
    var queryItems: [URLQueryItem]? {
        [.init(name: "page", value: String(page)),
         .init(name: "per_page", value: String(perPage))]
    }
    
    private let page: Int
    private let perPage: Int // 0 ~ 80
    
    init(page: Int, perPage: Int = 50) {
        self.page = page
        self.perPage = perPage
    }
}
