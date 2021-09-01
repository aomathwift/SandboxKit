//
//  PokemonRequest.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import SandboxKit

struct PokemonRequest: APIRequest {
    typealias Response = Pokemon
    var id: Int64
    var method: HTTPMethod = .get
    var path: String {
        return "/pokemons/\(id)"
    }
    var parameters: [String : Any] = [:]
}

