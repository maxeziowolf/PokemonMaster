//
//  UIColor+ExtensionTest.swift
//  PokemonMasterTests
//
//  Created by Maximiliano Ovando Ramírez on 15/07/23.
//

import XCTest
@testable import PokemonMaster

final class UIColorPlusExtensionTest: XCTestCase {

    func testNormalPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.normalPokemonColor, "Este color no existe")
    }

    func testFirePokemonColorNotNil() {
        XCTAssertNotNil(UIColor.firePokemonColor, "Este color no existe")
    }

    func testWaterPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.waterPokemonColor, "Este color no existe")
    }

    func testGrassPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.grassPokemonColor, "Este color no existe")
    }

    func testElectricPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.electricPokemonColor, "Este color no existe")
    }

    func testIcePokemonColorNotNil() {
        XCTAssertNotNil(UIColor.icePokemonColor, "Este color no existe")
    }

    func testFightingPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.fightingPokemonColor, "Este color no existe")
    }

    func testPoisonPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.poisonPokemonColor, "Este color no existe")
    }

    func testGroundPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.groundPokemonColor, "Este color no existe")
    }

    func testFlyingPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.flyingPokemonColor, "Este color no existe")
    }

    func testPsychicPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.psychicPokemonColor, "Este color no existe")
    }

    func testBugPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.bugPokemonColor, "Este color no existe")
    }

    func testRockPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.rockPokemonColor, "Este color no existe")
    }

    func testGhostPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.ghostPokemonColor, "Este color no existe")
    }

    func testDarkPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.darkPokemonColor, "Este color no existe")
    }

    func testDragonPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.dragonPokemonColor, "Este color no existe")
    }

    func testSteelPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.steelPokemonColor, "Este color no existe")
    }

    func testFairyPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.fairyPokemonColor, "Este color no existe")
    }

    func testDefaultPokemonColorNotNil() {
        XCTAssertNotNil(UIColor.defaultPokemonColor, "Este color no existe")
    }

    func testNormalPokemonColor() {
        XCTAssertEqual(UIColor.normalPokemonColor, UIColor(named: "NormalPokemonColor"), "No es el color correcto")
    }

    func testFirePokemonColor() {
        XCTAssertEqual(UIColor.firePokemonColor, UIColor(named: "FirePokemonColor"), "No es el color correcto")
    }

    func testFWaterPokemonColor() {
        XCTAssertEqual(UIColor.waterPokemonColor, UIColor(named: "WaterPokemonColor"), "No es el color correcto")
    }

    func testGrassPokemonColor() {
        XCTAssertEqual(UIColor.grassPokemonColor, UIColor(named: "GrassPokemonColor"), "No es el color correcto")
    }

    func testElectricPokemonColor() {
        XCTAssertEqual(UIColor.electricPokemonColor, UIColor(named: "ElectricPokemonColor"), "No es el color correcto")
    }

    func testIcePokemonColor() {
        XCTAssertEqual(UIColor.icePokemonColor, UIColor(named: "IcePokemonColor"), "No es el color correcto")
    }

    func testFightingPokemonColor() {
        XCTAssertEqual(UIColor.fightingPokemonColor, UIColor(named: "FightingPokemonColor"), "No es el color correcto")
    }

    func testPoisonPokemonColor() {
        XCTAssertEqual(UIColor.poisonPokemonColor, UIColor(named: "PoisonPokemonColor"), "No es el color correcto")
    }

    func testGroundPokemonColor() {
        XCTAssertEqual(UIColor.groundPokemonColor, UIColor(named: "GroundPokemonColor"), "No es el color correcto")
    }

    func testFlyingPokemonColor() {
        XCTAssertEqual(UIColor.flyingPokemonColor, UIColor(named: "FlyingPokemonColor"), "No es el color correcto")
    }

    func testPsychicPokemonColor() {
        XCTAssertEqual(UIColor.psychicPokemonColor, UIColor(named: "PsychicPokemonColor"), "No es el color correcto")
    }

    func testBugPokemonColor() {
        XCTAssertEqual(UIColor.bugPokemonColor, UIColor(named: "BugPokemonColor"), "No es el color correcto")
    }

    func testRockPokemonColor() {
        XCTAssertEqual(UIColor.rockPokemonColor, UIColor(named: "RockPokemonColor"), "No es el color correcto")
    }

    func testGhostPokemonColor() {
        XCTAssertEqual(UIColor.ghostPokemonColor, UIColor(named: "GhostPokemonColor"), "No es el color correcto")
    }

    func testDarkPokemonColor() {
        XCTAssertEqual(UIColor.darkPokemonColor, UIColor(named: "DarkPokemonColor"), "No es el color correcto")
    }

    func testDragonPokemonColor() {
        XCTAssertEqual(UIColor.dragonPokemonColor, UIColor(named: "DragonPokemonColor"), "No es el color correcto")
    }

    func testSteelPokemonColor() {
        XCTAssertEqual(UIColor.steelPokemonColor, UIColor(named: "SteelPokemonColor"), "No es el color correcto")
    }

    func testFairyPokemonColor() {
        XCTAssertEqual(UIColor.fairyPokemonColor, UIColor(named: "FairyPokemonColor"), "No es el color correcto")
    }

    func testDefaultPokemonColor() {
        XCTAssertEqual(UIColor.defaultPokemonColor, UIColor(named: "DefaultPokemonColor"), "No es el color correcto")
    }

    func testWhiteTransparent() {
        let expectedColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.4)
        XCTAssertEqual(UIColor.whiteTrasnparent, expectedColor, "No es el color correcto")
    }

    func testTextColorForLightBackground() {
        let lightBackgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        let expectedTextColor = UIColor.black
        XCTAssertEqual(UIColor.textColor(for: lightBackgroundColor), expectedTextColor, "No regreso el color correcto para el fondo, en este caso es el negro")
    }

    func testTextColorForDarkBackground() {
        let darkBackgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        let expectedTextColor = UIColor.white
        XCTAssertEqual(UIColor.textColor(for: darkBackgroundColor), expectedTextColor, "No regreso el color correcto para el fondo, en este caso es el Blanco")
    }

    func testTextColorForNilBackground() {
        let backgroundColor: UIColor? = nil
        let expectedTextColor = UIColor.black
        XCTAssertEqual(UIColor.textColor(for: backgroundColor), expectedTextColor, "No regreso el color correcto para el fondo, en este caso es el negro")
    }

    func testTextColorForCustomColor() {
        let customBackgroundColor = UIColor(red: 0.7, green: 0.2, blue: 0.5, alpha: 1.0)
        let expectedTextColor = UIColor.white
        XCTAssertEqual(UIColor.textColor(for: customBackgroundColor), expectedTextColor, "No regreso el color correcto para el fondo, en este caso es el blanco")
    }

    func testGetPokemonTypeColor() {
        let pokemonType = "Fire"
        let pokemonTypeCorrectColor = UIColor.firePokemonColor

        let pokemonTypeColor = UIColor.getPokemonTypeColor(pokemonType: pokemonType)

        XCTAssertEqual(pokemonTypeCorrectColor, pokemonTypeColor, "El color del tipo de pokemon no es el correcto, debio ser el mismo al tipo \"Fuego\"")
    }

}
