//
//  SearchPokemonUseCase.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 17/07/23.
//

import UIKit

protocol SearchPokemonUseCase {
    func execute(pokemonID id: Int, completion: @escaping (PokemonData?, [PokemonTypeData], PokemonDescription?, [String: UIImage], String?) -> Void)
}
