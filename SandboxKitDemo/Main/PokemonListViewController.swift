//
//  PokemonListViewController.swift
//  SandboxKitDemo
//
//  Created by aoi-okawa on 2021/09/01.
//

import Foundation
import UIKit

final class PokemonListViewController: UITableViewController {
    private var pokemons: [Pokemon] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        tableView.reloadData()
    }

    private func fetch() {
        ServiceClientProvider.default.sendRequest(PokemonListRequest()) { result in
            if case let .success(pokemons) = result {
                self.pokemons = pokemons
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = pokemon.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.row]
        navigationController?.pushViewController(PokemonDetailViewController(id: pokemon.id), animated: true)
    }
}
