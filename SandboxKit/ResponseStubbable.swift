//
//  ResponseStubbable.swift
//  SandboxKit
//
//  Created by aoi-okawa on 2021/09/15.
//

import Foundation

public protocol ResponseStubbable {
    var jsonData: Data? { get }
}

extension Data: ResponseStubbable {
    public var jsonData: Data? {
        return self
    }
}

extension String: ResponseStubbable {
    public var jsonData: Data? {
        return data(using: .utf8)
    }
}

public extension ResponseStubbable where Self: Encodable {
    var jsonData: Data? {
        let jsonEncoder = JSONEncoder()
        do {
            return try jsonEncoder.encode(self)
        } catch {
            fatalError("Could not encode \(error)")
        }
    }
}

extension Array: ResponseStubbable where Element: ResponseStubbable & Encodable {
    public var jsonData: Data? {
        let jsonEncoder = JSONEncoder()
        do {
            return try jsonEncoder.encode(self)
        } catch {
            fatalError("Could not encode \(error)")
        }
    }
}
