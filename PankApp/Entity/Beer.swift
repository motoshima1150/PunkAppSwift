//
//  Beer.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/14.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation

struct Beer: Decodable, Identifiable {
    let id: String
    let name: String
    let tagline: String
    let firstBrewed: String
    let description: String
    let imageURL: URL
    let abv: Double?
    let ibu: Double?
    let targetFG: Double
    let targetOG: Double
    let ebc: Double?
    let srm: Double?
    let ph: Double?
    let attenuationLevel: Double
    let volume: Measurement<UnitVolume>
    let boilVolume: Measurement<UnitVolume>
    let method: Method
    let ingredients: Ingredients
    let foodPairing: [String]
    let brewersTips: String
    let contributedBy: String
    
    enum CodingKeys: String, CodingKey {
      case id
      case name
      case tagline
      case firstBrewed
      case description
      case imageURL = "imageUrl"
      case abv
      case ibu
      case targetFG = "targetFg"
      case targetOG = "targetOg"
      case ebc
      case srm
      case ph
      case attenuationLevel
      case volume
      case boilVolume
      case method
      case ingredients
      case foodPairing
      case brewersTips
      case contributedBy
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let idValue = try values.decode(Int.self, forKey: .id)
        id = String(idValue)
        name = try values.decode(String.self, forKey: .name)
        tagline = try values.decode(String.self, forKey: .tagline)
        firstBrewed = try values.decode(String.self, forKey: .firstBrewed)
        description = try values.decode(String.self, forKey: .description)
        imageURL = try values.decode(URL.self, forKey: .imageURL)
        abv = try? values.decode(Double.self, forKey: .abv)
        ibu = try? values.decode(Double.self, forKey: .ibu)
        targetFG = try values.decode(Double.self, forKey: .targetFG)
        targetOG = try values.decode(Double.self, forKey: .targetOG)
        ebc = try? values.decode(Double.self, forKey: .ebc)
        srm = try? values.decode(Double.self, forKey: .srm)
        ph = try? values.decode(Double.self, forKey: .ph)
        attenuationLevel = try values.decode(Double.self, forKey: .attenuationLevel)
        let volumeValue = try values.decode(UnitValue.self, forKey: .volume)
        volume = Measurement(value: volumeValue.value, unit: .liters)
        let boilVolumeValue = try values.decode(UnitValue.self, forKey: .boilVolume)
        boilVolume = Measurement(value: boilVolumeValue.value, unit: .liters)
        method = try values.decode(Method.self, forKey: .method)
        ingredients = try values.decode(Ingredients.self, forKey: .ingredients)
        foodPairing = try values.decode([String].self, forKey: .foodPairing)
        brewersTips = try values.decode(String.self, forKey: .brewersTips)
        contributedBy = try values.decode(String.self, forKey: .contributedBy)
    }
}
