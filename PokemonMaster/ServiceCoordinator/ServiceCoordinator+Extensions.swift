//
//  ServiceCoordinator+Extensions.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 22/06/23.
//

import UIKit

extension Data {
    func toString() -> String {
        if let dataInfo = String(data: self, encoding: .utf8) {
            return dataInfo
        }

        return "Sin informacion"
    }
}
