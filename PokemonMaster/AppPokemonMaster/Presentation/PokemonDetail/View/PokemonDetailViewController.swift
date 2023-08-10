//
//  PokemonDetailViewController.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 12/07/23.
//

import UIKit
import Combine

class PokemonDetailViewController: UIViewController {

    // MARK: - Variables
    private var pokemonDetailView = PokemonDetailView()
    private var viewModel = PokemonDetailViewModel()
    private var anyCancellave: [AnyCancellable] = []
    private var id = 1

    final class func create(with viewModel: PokemonDetailViewModel) -> PokemonDetailViewController {
        let viewController = PokemonDetailViewController()
        viewController.viewModel = viewModel
        return viewController
    }

    override func loadView() {
        view = pokemonDetailView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        viewModel.didSearchPokemonInfo(pokemonID: id )

        pokemonDetailView.addGesture(viewController: self, beforeSelected: #selector(updateBefore), nextSelected: #selector(updateNext), swipeSeleted: #selector(updateSwipe))

    }

    private func bind(to viewModel: PokemonDetailViewModel) {
        let pokemonInfoObserver = viewModel.pokemonInformation.sink { completion in
            switch completion {
            case .finished:
                print("Se finalizo la comunicacion")
            case .failure(let error):
                print("Fallo la comunicacion en = \(error.localizedDescription)")
            }
        } receiveValue: { [weak self] pokemonInfo in
            self?.id = Int(pokemonInfo.pokemonID.replacingOccurrences(of: "#", with: "")) ?? 1
            self?.pokemonDetailView.setPokemonInformation(pokemonData: pokemonInfo)
            self?.pokemonDetailView.loaderView.isHidden = true
        }

        anyCancellave.append(pokemonInfoObserver)
    }

    @objc
    func updateSwipe(_ recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .left {
            updateNext()
        } else if recognizer.direction == .right {
            updateBefore()
        }
    }

    @objc
    func updateNext() {
        if (id + 1) < 151 {
            pokemonDetailView.loaderView.isHidden = false
            viewModel.didSelectedNextPokemon(pokemonID: id)
        }
    }

    @objc
    func updateBefore() {
        if (id - 1) > 0 {
            pokemonDetailView.loaderView.isHidden = false
            viewModel.didSelectedBeforePokemon(pokemonID: id)
        }
    }

}
