//
//  DefaultPokemonNetworkRepository.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 17/07/23.
//
import UIKit

final class DefaultPokemonNetworkRepository: PokemonNetworkRepository {

    func fetchPokemonData(pokemonID id: Int, completion: @escaping (PokemonData?, NSError?) -> Void) {

        let url = "\(PokemonAPIConstans.baseURLAPI)\(PokemonAPIConstans.pokemonDataEndpoint)\(id)"

        ServiceCoordinator.sendRequest(url: url, cachePolicy: .returnCacheDataElseLoad) { (response: ServiceStatus<PokemonData>) in
            switch response {

            case .success(data: let data):
                completion(data, nil)
            case .failed(error: let error):
                completion(nil, NSError(domain: error.rawValue, code: -99))
            case .unowned(error: let error):
                completion(nil, NSError(domain: error, code: -99))
            }

        }

    }

    func fetchPokemonDescription(pokemonID id: Int, completion: @escaping (PokemonDescription?, NSError?) -> Void) {
        let url = "\(PokemonAPIConstans.baseURLAPI)\(PokemonAPIConstans.pokemonDescriptionEndpoint)\(id)"

        ServiceCoordinator.sendRequest(url: url, cachePolicy: .returnCacheDataElseLoad) { (response: ServiceStatus<PokemonDescription>) in
            switch response {

            case .success(data: let data):
                completion(data, nil)
            case .failed(error: let error):
                completion(nil, NSError(domain: error.rawValue, code: -99))
            case .unowned(error: let error):
                completion(nil, NSError(domain: error, code: -99))
            }

        }
    }

    func fetcthPokemonImage(pokemonID id: Int, completion: @escaping (UIImage?, NSError?) -> Void) {
        let url = "\(PokemonAPIConstans.baseURLImage)\(id).png"

        ServiceCoordinator.sendRequest(url: url, cachePolicy: .returnCacheDataElseLoad) { (response: ServiceStatus<Data>) in
            switch response {

            case .success(data: let data):
                completion(UIImage(data: data), nil)
            case .failed(error: let error):
                completion(nil, NSError(domain: error.rawValue, code: -99))
            case .unowned(error: let error):
                completion(nil, NSError(domain: error, code: -99))
            }

        }
    }

    func fetcthPokemonType(url urlString: String, completion: @escaping (PokemonTypeData?, NSError?) -> Void) {

        ServiceCoordinator.sendRequest(url: urlString, cachePolicy: .returnCacheDataElseLoad) { (response: ServiceStatus<PokemonTypeData?>) in
            switch response {

            case .success(data: let data):
                completion(data, nil)
            case .failed(error: let error):
                completion(nil, NSError(domain: error.rawValue, code: -99))
            case .unowned(error: let error):
                completion(nil, NSError(domain: error, code: -99))
            }

        }
    }

}
