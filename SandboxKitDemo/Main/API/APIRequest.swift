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
}
