//
//  ServiceClientProvider.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation

final class ServiceClientProvider {
    public static let injectionContainer: Injections = .init()
    public class Injections {
        public var serviceClient: ServiceClient!
    }

    public static var `default`: ServiceClient {
        guard let serviceClient = injectionContainer.serviceClient else {
            fatalError("Inject before use")
        }
        return serviceClient
    }
    private init() {}
}
