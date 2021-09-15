//
//  PokemonDetailViewController.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import UIKit

final class PokemonDetailViewController: UIViewController {
    private let id: Int64
    init(id: Int64) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 36)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let typeLabel = UILabel()
        typeLabel.font = .systemFont(ofSize: 24)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        let heightLabel = UILabel()
        heightLabel.font = .systemFont(ofSize: 24)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        let weightLabel = UILabel()
        weightLabel.font = .systemFont(ofSize: 24)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        let stackView = UIStackView(
            arrangedSubviews: [
                nameLabel,
                typeLabel,
                heightLabel,
                weightLabel,
            ]
        )
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        ServiceClientProvider.default.sendRequest(PokemonRequest(id: id)) { result in
            if case let .success(pokemon) = result {
                nameLabel.text = pokemon.name
                typeLabel.text = "Type：\(pokemon.pokemonType.rawValue)"
                heightLabel.text = "Height：\(pokemon.height) m"
                weightLabel.text = "Weight：\(pokemon.weight) kg"
            }
        }
    }
}
