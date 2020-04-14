//
//  Fermentation.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/15.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation

struct Fermentation: Decodable {
    let temp: Measurement<UnitTemperature>
    
    enum CodingKeys: String, CodingKey {
        case temp
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let unitValue = try values.decode(UnitValue.self, forKey: .temp)
        temp = Measurement(value: unitValue.value, unit: .celsius)
    }
}

