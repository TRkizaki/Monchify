//
//  SettingsModels.swift
//  Monchify
//
//  Created by DJ perrier  on 13/2/22.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
    
}

struct Option {
    let title: String
    let handler: () -> Void 
}
