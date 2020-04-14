//
//  Request.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/14.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation

protocol Request {
    associatedtype Response: Decodable
    
    var baseURL: URL { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}
