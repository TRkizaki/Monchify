//
//  Artist.swift
//  Monchify
//
//  Created by DJ perrier  on 10/2/22.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
    
}
