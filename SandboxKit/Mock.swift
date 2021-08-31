//
//  Mock.swift
//  SandboxKit
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation

public struct Mock {
    public var path: String
    public var statusCode: Int
    public var method: HTTPMethod
    public var json: JSONData
}

public struct JSONData {
    public var data: Data?

    public init(from basename: String) {
        if let path = Bundle.main.path(forResource: basename, ofType: "json"),
              let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            self.data = jsonData
        } else {
            self.data = nil
        }
    }

    public init(_ rowData: String) {
        self.data = rowData.data(using: .utf8)
    }
}

@resultBuilder
public enum JSONDataBuilder {
    public static func buildBlock(_ components: JSONData...) -> [JSONData] {
        components
    }
}

public extension Mock {
    init(path: String, statusCode: Int, method: HTTPMethod, @JSONDataBuilder _ makeJSONData: () -> [JSONData]) {
        self.init(path: path, statusCode: statusCode, method: method, json: makeJSONData().first ?? .init(""))
    }
}
