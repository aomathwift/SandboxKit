//
//  Pokemon.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation

struct Pokemon: Decodable {
    var id: Int64
    var name: String
    var type: PokemonType
}
