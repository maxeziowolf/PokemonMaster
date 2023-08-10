//
//  UIView+Extensions.swift
//  PokemonMasterTests
//
//  Created by Maximiliano Ovando Ramírez on 15/07/23.
//

import XCTest
@testable import PokemonMaster

final class UIViewPlusExtensionsTest: XCTestCase {

    func testStartRotationAnimationNoIdentity() {
        let view = UIView()

        view.startRotationAnimation(animationDuration: 1.0)

        RunLoop.current.run(until: Date(timeIntervalSinceNow: 3.0))

        XCTAssertNotEqual(view.transform, CGAffineTransform.identity)
    }

}
