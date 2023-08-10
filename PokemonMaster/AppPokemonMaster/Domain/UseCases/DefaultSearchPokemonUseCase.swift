//
//  DefaultSearchPokemonUseCase.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 17/07/23.
//

import UIKit

final class DefaultSearchPokemonUseCase: SearchPokemonUseCase {

    private let pokemonRepository = DefaultPokemonNetworkRepository ()
    private let group = DispatchGroup()

    func execute(pokemonID id: Int, completion: @escaping (PokemonData?, [PokemonTypeData], PokemonDescription?, [String : UIImage], String?) -> Void) {
        var pokemonData: PokemonData?
        var pokemonDescription: PokemonDescription?
        var imageDictionary: [String: UIImage] = [:]
        var errorMessage: String?
        var pokemonTypesData: [PokemonTypeData] = []
        
        group.enter()
        pokemonRepository.fetchPokemonData(pokemonID: id) {[weak self] result, error  in
            
            if let error = error {
                errorMessage = "La informacion del pokemon no se pudo obtener"
                self?.group.leave()
                return
            }
            
            guard let data = result else {
                errorMessage = "La informacion del pokemon no se pudo obtener"
                self?.group.leave()
                return
            }
            
            pokemonData = data
            
            pokemonData?.types?.forEach({ type in
                if let url = type.type?.url {
                    self?.group.enter()
                    self?.pokemonRepository.fetcthPokemonType(url: url) { pokemonTypeData, error in
                        if let pokemonTypeData = pokemonTypeData {
                            pokemonTypesData.append(pokemonTypeData)
                        }
                        self?.group.leave()
                    }
                }
            })
            
            self?.group.leave()
            
        }
        
        group.enter()
        pokemonRepository.fetchPokemonDescription(pokemonID: id) {[weak self] result, error  in
            
            if let error = error {
                errorMessage = "La informacion del pokemon no se pudo obtener"
                self?.group.leave()
                return
            }
            
            guard let data = result else {
                errorMessage = "La informacion del pokemon no se pudo obtener"
                self?.group.leave()
                return
            }
            
            pokemonDescription = data
            self?.group.leave()
            
        }
        
        if id > 1 {
            group.enter()
            pokemonRepository.fetcthPokemonImage(pokemonID: (id - 1)) {[weak self] image, error in
                if let error = error {
                    errorMessage = "La imagen del pokemon anterior no se pudo obtener"
                    self?.group.leave()
                    return
                }
                
                guard let data = image else {
                    errorMessage = "La imagen del pokemon anterior no se pudo obtener"
                    self?.group.leave()
                    return
                }
                
                imageDictionary["beforePokemonImage"] = data
                self?.group.leave()
            }
        }
        
        if id < 151 {
            group.enter()
            pokemonRepository.fetcthPokemonImage(pokemonID: (id + 1)) {[weak self] image, error in
                if let error = error {
                    errorMessage = "La imagen del pokemon siguiente no se pudo obtener"
                    self?.group.leave()
                    return
                }
                
                guard let data = image else {
                    errorMessage = "La imagen del pokemon siguiente no se pudo obtener"
                    self?.group.leave()
                    return
                }
                
                imageDictionary["nextPokemonImage"] = data
                self?.group.leave()
            }
        }
        
        group.enter()
        pokemonRepository.fetcthPokemonImage(pokemonID: (id)) {[weak self] image, error in
            if let error = error {
                errorMessage = "La imagen del pokemon anterior no se pudo obtener"
                self?.group.leave()
                return
            }
            
            guard let data = image else {
                errorMessage = "La imagen del pokemon anterior no se pudo obtener"
                self?.group.leave()
                return
            }
            
            imageDictionary["pokemonImage"] = data
            self?.group.leave()
        }
        
        group.notify(queue: .main){
            completion(pokemonData, pokemonTypesData, pokemonDescription, imageDictionary, errorMessage)
        }
        
    }
    
}
