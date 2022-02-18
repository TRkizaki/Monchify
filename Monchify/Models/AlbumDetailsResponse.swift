//
//  AlbumDetailsResponse.swift
//  Monchify
//
//  Created by DJ perrier  on 17/2/22.
//

import Foundation

struct AlbumDetailsResponse: Codable {
    let album_type: String
    let artists: [Artist]
    let available_markets: [String]
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let label: String
    let name: String
    let tracks: TracksResponses
}

struct TracksResponses: Codable {
    let items: [AudioTrack]
    
}
   
    
    
   

    
   
