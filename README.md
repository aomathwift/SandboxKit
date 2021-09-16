# SandboxKit

This framework makes debugging more efficient in your application.

Sandbox is the name of a structure that improves the efficiency of debugging your application.

Branch the startup Scene at the entry point of your application with using debug flag and the Scene that you want to debug is launched from the beginning.

This framework is introduced in iOSDC 2021.
## Installation

### Cocoapods

```
use_frameworks!

pod 'SandboxKit'
```

## Usage

1. Install `SandboxKit` in your application.

2. Add a new schema from `Manage Schemes` in Xcode, and specify the environment variable `RUNNING_SANDBOX` from the Argument item in the Run configuration.

3. In AppDelegate, check the existence of the environment variable from Prosess, and if it is started with the schema for the Sandbox, specify the rootViewController for Sandbox.

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if ProcessInfo.processInfo.environment["RUNNING_MINIAPP"] == "1" {
            window = UIWindow(frame: UIScreen.main.bounds)
            let viewController = ViewController {
                Scene(
                    name: "PokemonDetail",
                    PokemonDetailViewController(id: 133)
                ) {
                    Mock(path: "/pokemons/133", statusCode: 200, method: .get) {
                        JSONData(from: "pokemon")
                    }
                }

                /// ....
            }
            window?.rootViewController = UINavigationController(rootViewController: viewController)
            window?.makeKeyAndVisible()
            return true
        }

        /// ....
        return true
    }
}
```

4. Inherit `SandboxKit.SandboxSceneSelectTableViewController` and implement your stub and your initialization.

```swift
final class ViewController: SandboxSceneSelectTableViewController {
    override init(@SandboxScenes _ makeScenes: () -> [Scene]) {
        super.init(makeScenes)
    }

    override func initializeScene(_ scene: Scene) {
      /// ....
    }
}
```

5. Select Sandbox schema and launch your application.


See `SandboxKitDemo` for detailed implementation.
## License

SandboxKit is released under the MIT License.
