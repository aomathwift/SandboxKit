//
//  AppDelegate.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import UIKit
import SandboxKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        if ProcessInfo.processInfo.environment["RUNNING_MINIAPP"] == "1" {
            window = UIWindow(frame: UIScreen.main.bounds)
            let viewController = MiniAppMainViewController {
                Scene(
                    name: "PokemonDetail",
                    PokemonDetailViewController(id: 133)
                ) {
                    Mock(path: "/pokemons/133", statusCode: 200, method: .get) {
                        JSONData(from: "pokemon")
                    }
                }
                Scene(
                    name: "PokemonList",
                    PokemonListViewController()
                ) {
                    Mock(path: "/pokemons", statusCode: 200, method: .get) {
                        JSONData(from: "pokemons")
                    }
                }
            }
            window?.rootViewController = UINavigationController(rootViewController: viewController)
            window?.makeKeyAndVisible()
            return true
        }
        #endif
        ServiceClientProvider.injectionContainer.serviceClient = MainServiceClient()
        let rootViewController = UINavigationController(rootViewController: PokemonListViewController())
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}

