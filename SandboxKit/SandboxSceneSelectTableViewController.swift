//
//  SandboxSceneSelectTableViewController.swift
//  SandboxKit
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import UIKit

open class SandboxSceneSelectTableViewController: UITableViewController {
    private let scenes: [Scene]
    public init(@SandboxScenes _ makeScenes: () -> [Scene]) {
        self.scenes = makeScenes()
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.reloadData()
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scenes.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedScene = scenes[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = selectedScene.name
        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedScene = scenes[indexPath.row]
        initializeScene(selectedScene)
        navigationController?.pushViewController(selectedScene.viewController, animated: true)
    }

    open func initializeScene(_ scene: Scene) {

        /// Override this method in your application and write initialization such as registering your own stub request.
    }
}

