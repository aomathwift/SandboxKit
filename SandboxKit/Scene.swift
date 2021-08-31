//
//  Scene.swift
//  SandboxKit
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import UIKit

public struct Scene {
    public var name: String
    public var viewController: UIViewController
    public var stubData: [Mock]
}

@resultBuilder
public enum SandboxScenes {
    public static func buildBlock(_ components: Scene...) -> [Scene] {
        components
    }
}

public extension Scene {
    init(name: String, _ viewController: UIViewController, @SceneBuilder _ makeStubJson: () -> [Mock]) {
        self.init(name: name, viewController: viewController, stubData: makeStubJson())
    }
}

@resultBuilder
public enum SceneBuilder {
    public static func buildBlock(_ components: Mock...) -> [Mock] {
        components
    }
}
