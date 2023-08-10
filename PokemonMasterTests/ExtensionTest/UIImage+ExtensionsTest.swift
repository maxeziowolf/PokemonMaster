//
//  UIImage+Extensions.swift
//  PokemonMasterTests
//
//  Created by Maximiliano Ovando Ramírez on 15/07/23.
//

import XCTest
@testable import PokemonMaster

final class UIImagePlusExtensionsTest: XCTestCase {

    func testPokeballLogoNotNil() {
        let pokeballLogoImage = UIImage.pokeballLogo
        XCTAssertNotNil(pokeballLogoImage, "La imagen no existe")
    }

    func testPokemonDummyNotNil() {
        let pokemonDummyImage = UIImage.pokemonDummy
        XCTAssertNotNil(pokemonDummyImage, "La imagen no existe")
    }

    func testPokemonDummy2NotNil() {
        let pokemonDummy2Image = UIImage.pokemonDummy2
        XCTAssertNotNil(pokemonDummy2Image, "La imagen no existe")
    }

    func testPokeballLogo() {
        let pokeballLogoImage = UIImage.pokeballLogo
        XCTAssertEqual(pokeballLogoImage, UIImage(named: "pokeball.logo.image"), "La imagen no es la misma")
    }

    func testPokemonDummy() {
        let pokemonDummyImage = UIImage.pokemonDummy
        XCTAssertEqual(pokemonDummyImage, UIImage(named: "dummy.pokemon.image"), "La imagen no es la misma")
    }

    func testPokemonDummy2() {
        let pokemonDummy2Image = UIImage.pokemonDummy2
        XCTAssertEqual(pokemonDummy2Image, UIImage(named: "dummy2.pokemon.image"), "La imagen no es la misma")
    }

}
