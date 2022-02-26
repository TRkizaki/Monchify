//
//  AudioTrack.swift
//  Monchify
//
//  Created by DJ perrier  on 10/2/22.
//

import Foundation

struct AudioTrack : Codable {
    var album : Album? //changed var
    let artists: [Artist]
    let available_markets: [String]
    let disc_number: Int
    let duration_ms: Int
    let explicit: Bool
    let external_urls: [String: String]
    let id: String
    let name: String
    let preview_url: String?
}
