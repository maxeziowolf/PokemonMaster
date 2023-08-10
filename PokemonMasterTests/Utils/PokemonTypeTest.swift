//
//  PokemonTypeTest.swift
//  PokemonMasterTests
//
//  Created by Maximiliano Ovando Ramírez on 16/07/23.
//

import XCTest
@testable import PokemonMaster

final class PokemonTypeTest: XCTestCase {

    func testGetPokemonTypeColorCorrect() {
        let typeName = "Fire"
        let expectedColor = UIColor(named: "FirePokemonColor")

        let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

        XCTAssertEqual(color, expectedColor)
    }

    func testGetPokemonTypeColorIncorrect() {
        let typeName = "InvalidType"
        let defaultColor = UIColor.defaultPokemonColor

        let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

        XCTAssertEqual(color, defaultColor)
    }
    func testGetNormalPokemonTypeColor() {
        let typeName = "Normal"
        let expectedColor = UIColor(named: "NormalPokemonColor")!

        let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

        XCTAssertEqual(color, expectedColor)
    }

    func testGetFirePokemonTypeColor() {
        let typeName = "Fire"
        let expectedColor = UIColor(named: "FirePokemonColor")!

        let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

        XCTAssertEqual(color, expectedColor)
    }

    func testGetWaterPokemonTypeColor() {
           let typeName = "Water"
           let expectedColor = UIColor(named: "WaterPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetGrassPokemonTypeColor() {
           let typeName = "Grass"
           let expectedColor = UIColor(named: "GrassPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetElectricPokemonTypeColor() {
           let typeName = "Electric"
           let expectedColor = UIColor(named: "ElectricPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetIcePokemonTypeColor() {
           let typeName = "Ice"
           let expectedColor = UIColor(named: "IcePokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetFightingPokemonTypeColor() {
           let typeName = "Fighting"
           let expectedColor = UIColor(named: "FightingPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetPoisonPokemonTypeColor() {
           let typeName = "Poison"
           let expectedColor = UIColor(named: "PoisonPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetGroundPokemonTypeColor() {
           let typeName = "Ground"
           let expectedColor = UIColor(named: "GroundPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetFlyingPokemonTypeColor() {
           let typeName = "Flying"
           let expectedColor = UIColor(named: "FlyingPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetPsychicPokemonTypeColor() {
           let typeName = "Psychic"
           let expectedColor = UIColor(named: "PsychicPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetBugPokemonTypeColor() {
           let typeName = "Bug"
           let expectedColor = UIColor(named: "BugPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetRockPokemonTypeColor() {
           let typeName = "Rock"
           let expectedColor = UIColor(named: "RockPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetGhostPokemonTypeColor() {
           let typeName = "Ghost"
           let expectedColor = UIColor(named: "GhostPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetDarkPokemonTypeColor() {
           let typeName = "Dark"
           let expectedColor = UIColor(named: "DarkPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetDragonPokemonTypeColor() {
           let typeName = "Dragon"
           let expectedColor = UIColor(named: "DragonPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetSteelPokemonTypeColor() {
           let typeName = "Steel"
           let expectedColor = UIColor(named: "SteelPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetFairyPokemonTypeColor() {
           let typeName = "Fairy"
           let expectedColor = UIColor(named: "FairyPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

       func testGetDefaultPokemonTypeColor() {
           let typeName = "default"
           let expectedColor = UIColor(named: "DefaultPokemonColor")!

           let color = PokemonTypes.getPokemonTypeColor(pokemonType: typeName)

           XCTAssertEqual(color, expectedColor)
       }

}
