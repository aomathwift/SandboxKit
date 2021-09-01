//
//  MiniAppMainViewController.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import SandboxKit

final class MiniAppMainViewController: SandboxSceneSelectTableViewController {
    override init(@SandboxScenes _ makeScenes: () -> [Scene]) {
        super.init(makeScenes)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initializeScene(_ scene: Scene) {
        let stubbableServiceClient = StubbableServiceClient()
        for mock in scene.stubData {
            if let jsonData = mock.json.data {
                stubbableServiceClient.registerClientResponse(jsonData, for: mock.path, method: mock.method, statusCode: mock.statusCode)
            }
        }
        ServiceClientProvider.injectionContainer.serviceClient = stubbableServiceClient
    }
}
