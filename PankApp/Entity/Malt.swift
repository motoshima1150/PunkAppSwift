//
//  Malt.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/15.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation

struct Malt: Decodable {
    let name: String
    let amount: Measurement<UnitMass>
    
    enum CodingKeys: String, CodingKey {
        case name
        case amount
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        let unitValue = try values.decode(UnitValue.self, forKey: .amount)
        amount = Measurement(value: unitValue.value, unit: .kilograms)
    }
}
