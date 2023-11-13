//
//  Locations.swift
//  LocationWiki
//
//  Created by Shehan Gunarathne on 06/11/2023.
//

import Foundation

// MARK: - Location
struct LocationsResponse: Codable {
    let locations: [Location]
    
    enum CodingKeys: CodingKey {
        case locations
    }
}

// MARK: - LocationElement
struct Location: Codable, Identifiable {
    var id = UUID()
    let name: String?
    let lat, long: Decimal
    
    enum CodingKeys: CodingKey {
        case name
        case lat
        case long
    }
}
