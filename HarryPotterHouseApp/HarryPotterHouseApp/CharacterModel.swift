//
//  CharacterModel.swift
//  HarryPotterHouseApp
//
//  Created by Omveer Panwar on 05/11/24.
//

import Foundation

struct Character: Identifiable, Decodable {
    var id: UUID = UUID()
    let name: String
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let image: String?
    let hogwartsStaff: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name, species, gender, house, dateOfBirth, image, hogwartsStaff
    }
}
