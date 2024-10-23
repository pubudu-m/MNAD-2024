//
//  Breed.swift
//  MyCats
//
//  Created by Pubudu Mihiranga on 2024-10-23.
//

import Foundation

struct Breed: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let description: String
    let imageId: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case description
        case imageId = "reference_image_id"
    }
}
