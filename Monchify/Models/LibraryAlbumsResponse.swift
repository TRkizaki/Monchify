//
//  LibraryAlbumsResponse.swift
//  Monchify
//
//  Created by DJ perrier  on 27/2/22.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
