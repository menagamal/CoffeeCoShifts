//
//  ShiftsResponse.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import Foundation


struct ShiftsResponse : Codable {
    let shifts : [Shift]?

    enum CodingKeys: String, CodingKey {

        case shifts = "shifts"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shifts = try values.decodeIfPresent([Shift].self, forKey: .shifts)
    }

}
