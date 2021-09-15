//
//  PokemonListRequest.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import SandboxKit

struct PokemonListRequest: APIRequest {
    typealias Response = [Pokemon]
    var method: HTTPMethod = .get
    var path: String = "/pokemons"
    var parameters: [String : Any] = [:]

    struct Pokemon: Decodable {
        var id: Int64
        var name: String
    }
}
