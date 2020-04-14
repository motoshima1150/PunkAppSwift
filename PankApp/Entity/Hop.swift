//
//  Hop.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/15.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation

struct Hop: Decodable {
    let name: String
    let amount: Measurement<UnitMass>
    let add: String
    let attribute: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case amount
        case add
        case attribute
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        let unitValue = try values.decode(UnitValue.self, forKey: .amount)
        amount = Measurement(value: unitValue.value, unit: .grams)
        add = try values.decode(String.self, forKey: .add)
        attribute = try values.decode(String.self, forKey: .attribute)
    }
    
}
