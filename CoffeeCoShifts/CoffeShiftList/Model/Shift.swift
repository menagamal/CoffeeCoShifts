//
//  Shift.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//
import Foundation
struct Shift : Codable {
    let role : String?
    let name : String?
    var start_date : String?
    let end_date : String?
    let color : String?
    
    var formattedStartDate: String?
    var formattedStartTime: String?

    enum CodingKeys: String, CodingKey {

        case role = "role"
        case name = "name"
        case start_date = "start_date"
        case end_date = "end_date"
        case color = "color"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        if let start_date = start_date {
            formattedStartDate = DateFormatter.stringDateOnly(iso: start_date)
            formattedStartTime = DateFormatter.stringTimeOnly(iso: start_date)
        }
    }

}
