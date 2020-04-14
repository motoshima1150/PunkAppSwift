//
//  MashTemperature.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/15.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation

struct MashTemperature: Decodable {
    let temp: Measurement<UnitTemperature>
    let duration: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case duration
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let unitValue = try values.decode(UnitValue.self, forKey: .temp)
        temp = Measurement(value: unitValue.value, unit: .celsius)
        duration = try values.decode(Double.self, forKey: .duration)
    }
}
