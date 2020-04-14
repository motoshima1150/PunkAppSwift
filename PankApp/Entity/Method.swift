//
//  Method.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/15.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation

struct Method: Decodable {
    let mashTemp: [MashTemperature]
    let fermentation: Fermentation
    let twist: String?
}
