/**
 *  CGOperators
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import CoreGraphics
import XCTest
import CGOperators

final class CGOperatorsTests: XCTestCase {
    func testAddingPoints() {
        XCTAssertEqual(CGPoint(x: 10, y: 20) + CGPoint(x: 50, y: 70),
                       CGPoint(x: 60, y: 90))
    }

    func testAddingSizeAndPoint() {
        XCTAssertEqual(CGSize(width: 30, height: 40) + CGPoint(x: 10, y: 90),
                       CGSize(width: 40, height: 130))
    }

    func testAddingVectorAndSize() {
        XCTAssertEqual(CGVector(dx: 5, dy: 25) + CGSize(width: 15, height: 35),
                       CGVector(dx: 20, dy: 60))
    }

    func testSubtractingPoints() {
        XCTAssertEqual(CGPoint(x: 50, y: 70) - CGPoint(x: 10, y: 20),
                       CGPoint(x: 40, y: 50))
    }

    func testSubtractingPointFromSize() {
        XCTAssertEqual(CGSize(width: 100, height: 90) - CGPoint(x: 10, y: 20),
                       CGSize(width: 90, height: 70))
    }

    func testSubtractingSizeFromVector() {
        XCTAssertEqual(CGVector(dx: 30, dy: 60) - CGSize(width: 10, height: 20),
                       CGVector(dx: 20, dy: 40))
    }

    func testMultiplyingPoint() {
        XCTAssertEqual(CGPoint(x: 150, y: 100) * 3,
                       CGPoint(x: 450, y: 300))
    }

    func testMultiplyingSize() {
        XCTAssertEqual(CGSize(width: 150, height: 100) * 3,
                       CGSize(width: 450, height: 300))
    }

    func testMultiplyingVector() {
        XCTAssertEqual(CGVector(dx: 150, dy: 100) * 3,
                       CGVector(dx: 450, dy: 300))
    }

    func testDividingPoint() {
        XCTAssertEqual(CGPoint(x: 500, y: 1000) / 5,
                       CGPoint(x: 100, y: 200))
    }

    func testDividingSize() {
        XCTAssertEqual(CGSize(width: 500, height: 1000) / 5,
                       CGSize(width: 100, height: 200))
    }

    func testDividingVector() {
        XCTAssertEqual(CGVector(dx: 500, dy: 1000) / 5,
                       CGVector(dx: 100, dy: 200))
    }
}
