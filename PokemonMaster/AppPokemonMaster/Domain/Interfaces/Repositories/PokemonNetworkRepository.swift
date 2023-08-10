//
//  PokemonNetworkRepository.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 17/07/23.
//

import UIKit

protocol PokemonNetworkRepository {
    func fetchPokemonData(pokemonID id: Int, completion: @escaping (PokemonData?, NSError?) -> Void)
    func fetchPokemonDescription(pokemonID id: Int, completion: @escaping (PokemonDescription?, NSError?) -> Void)
    func fetcthPokemonImage(pokemonID id: Int, completion: @escaping (UIImage?, NSError?) -> Void)
}
