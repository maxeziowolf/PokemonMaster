//
//  PokemonDetailViewModel.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 16/07/23.
//

import UIKit
import Combine

// MARK: - Protocolos
protocol PokemonDetailModelInput {
    func didSearchPokemonInfo (pokemonID id: Int)
    func didSelectedNextPokemon (pokemonID id: Int)
    func didSelectedBeforePokemon (pokemonID id: Int)
}

protocol PokemonDetailOutput {
    var pokemonInformation: PassthroughSubject<PokemonInformation, Error> { get }
}

protocol PokemonDetailViewModelProtocols: PokemonDetailModelInput, PokemonDetailOutput { }

// MARK: - ViewModel
final class PokemonDetailViewModel: PokemonDetailViewModelProtocols {

    // MARK: - Values
    private let searchPokemonUseCase = DefaultSearchPokemonUseCase()

    // MARK: - OUTPUT Values
    var pokemonInformation: PassthroughSubject<PokemonInformation, Error> = PassthroughSubject()

    // MARK: - Functions
    private func loadPokemonInformation(pokemonID id: Int) {

        searchPokemonUseCase.execute(pokemonID: id) {[weak self] pokemonData, pokemonTypeData, pokemonInformationData, pokemonImages, messageError in

            if let messageError = messageError {
                self?.pokemonInformation.send(completion: .failure(NSError(domain: messageError, code: -99)))
                return
            }

            guard let pokemonData = pokemonData, let pokemonInformationData = pokemonInformationData else {
                self?.pokemonInformation.send(completion: .failure(NSError(domain: "Ocurrio un erro extraño", code: -99)))
                return
            }

            let information = PokemonInformation(pokemonData: pokemonData, pokemonTypeData: pokemonTypeData, pokemonDescription: pokemonInformationData, pokemonImages: pokemonImages)

            self?.pokemonInformation.send(information)

        }

    }

}

// MARK: - FunctionsExtension
extension PokemonDetailViewModel {

    func didSearchPokemonInfo(pokemonID id: Int) {
        loadPokemonInformation(pokemonID: id)
    }

    func didSelectedNextPokemon(pokemonID id: Int) {
        loadPokemonInformation(pokemonID: (id + 1))
    }

    func didSelectedBeforePokemon(pokemonID id: Int) {
        loadPokemonInformation(pokemonID: (id - 1))
    }

}

// MARK: Model for view
struct PokemonInformation {
    let pokemonName: String
    let pokemonID: String
    let pokemonTypes: [String]
    let pokemonType: String
    let pokemonBackground: UIColor?
    let pokemonColorText: UIColor?
    let beforePokemonImage: UIImage?
    let nextPokemonImage: UIImage?
    let pokemonImage: UIImage?
    let pokemonDescription: String
}

extension PokemonInformation {

    init(pokemonData: PokemonData, pokemonTypeData: [PokemonTypeData], pokemonDescription: PokemonDescription, pokemonImages: [String: UIImage]) {
        pokemonName = (pokemonData.name ?? "No name").capitalized
        pokemonID = (pokemonData.id ?? 0).getNumberWithFormtat()
        pokemonTypes = pokemonTypeData.compactMap({ type in
            return type.names?.first(where: {($0.language?.name ?? "en") == (Locale.current.language.languageCode?.identifier ?? "en") })?.name?.capitalized
        })
        pokemonType = "Pókemon \(((pokemonTypeData.first?.names?.first(where: {($0.language?.name ?? "en") == (Locale.current.language.languageCode?.identifier ?? "en") })?.name?.capitalized) ?? "Without type").capitalized)"
        pokemonBackground = UIColor.getPokemonTypeColor(pokemonType: (pokemonData.types?.first?.type?.name ?? "Without type"))
        pokemonColorText = UIColor.textColor(for: pokemonBackground)
        beforePokemonImage = pokemonImages["beforePokemonImage"]
        nextPokemonImage = pokemonImages["nextPokemonImage"]
        pokemonImage = pokemonImages["pokemonImage"]

        var description = ""
        pokemonDescription.flavorTextEntries?.forEach({ text in
            if let flavorText = text.flavorText, text.language?.name == Locale.current.language.languageCode?.identifier {
                description += "\(flavorText) \n"
            }
        })

        self.pokemonDescription =  description
    }

}
