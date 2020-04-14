//
//  APIServiceError.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/14.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case requestError
    case responseError
    case parseError(Error)
}
