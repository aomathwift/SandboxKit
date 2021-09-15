//
//  APIRequest.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import SandboxKit

protocol APIRequest {
    associatedtype Response
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    func makeResponse(from data: Data, urlResponse: HTTPURLResponse) throws -> Response
}

extension APIRequest where Response: Decodable {
    func makeResponse(from data: Data, urlResponse: HTTPURLResponse) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}
