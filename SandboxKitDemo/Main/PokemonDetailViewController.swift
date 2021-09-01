//
//  PokemonDetailViewController.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import UIKit

final class PokemonDetailViewController: UIViewController {
    private var pokemon: Pokemon?
    private let id: Int64
    init(id: Int64) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
        ServiceClientProvider.default.sendRequest(PokemonRequest(id: id)) { result in
            if case let .success(pokemon) = result {
                self.pokemon = pokemon
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = pokemon?.name
        let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.text = pokemon?.type.rawValue
        let stackView = UIStackView(arrangedSubviews: [nameLabel, typeLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
