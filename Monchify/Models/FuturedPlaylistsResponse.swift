//
//  FuturedPlaylistsResponse.swift
//  Monchify
//
//  Created by DJ perrier  on 15/2/22.
//

import Foundation

struct FeaturedPlaylistsResponse: Codable {
    let playlists: PlaylistResoponse
}

struct PlaylistResoponse: Codable {
    let items: [Playlist]
}

struct User: Codable {
    let display_name: String
    let external_urls: [String: String]
    let id: String

}
