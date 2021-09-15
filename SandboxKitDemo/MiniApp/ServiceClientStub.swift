//
//  ServiceClientStub.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/15.
//

import Foundation
import SandboxKit

#if DEBUG
struct ServiceClientStub {
    typealias Response = Swift.Result<Data?, Error>
    var path: String
    var method: HTTPMethod
    var parameters: [String: Any]
    var result: Response
    var urlResponse: HTTPURLResponse

    init(
        path: String,
        method: HTTPMethod,
        parameters: [String: Any] = [:],
        result: ServiceClientStub.Response,
        urlResponse: HTTPURLResponse = .init()
    ) {
        let characterSet: CharacterSet = .urlPathAllowed
        let shouldNotContainsInvalidCharacter = path.unicodeScalars.allSatisfy { characterSet.contains($0) }
        assert(shouldNotContainsInvalidCharacter, "path \(path) contains invalid characters.")
        self.path = path
        self.method = method
        self.result = result
        self.parameters = parameters
        self.urlResponse = urlResponse
    }
}
#endif
