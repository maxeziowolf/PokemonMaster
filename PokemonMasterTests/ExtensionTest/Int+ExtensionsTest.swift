//
//  Int+Extensions.swift
//  PokemonMasterTests
//
//  Created by Maximiliano Ovando Ramírez on 15/07/23.
//

import XCTest
@testable import PokemonMaster

final class IntPlusExtensionsTest: XCTestCase {

    func testGetNumberWithFormatCorrect() {
        let number = 42
        let formattedNumber = number.getNumberWithFormtat()
        XCTAssertEqual(formattedNumber, "#042")
    }

    func testGetNumberWithFormatIncorrect() {
        let number = -10
        let formattedNumber = number.getNumberWithFormtat()
        XCTAssertNotEqual(formattedNumber, "#-010")
    }

}
