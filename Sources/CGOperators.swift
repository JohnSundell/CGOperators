/**
 *  CGOperators
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import CoreGraphics

/// Protocol used to describe a type as a Core Graphics 2D vector
/// Default implementations are provided for `CGPoint`, `CGSize` & `CGVector`
public protocol CGVectorProtocol {
    /// The X & Y components that make up this vector
    var components: (x: CGFloat, y: CGFloat) { get }

    /// Initialize an instance of this type with X & Y components
    /// - parameter components: The components to fill in the vector with
    init(components: (x: CGFloat, y: CGFloat))
}

extension CGPoint: CGVectorProtocol {
    public var components: (x: CGFloat, y: CGFloat) {
        return (x, y)
    }

    public init(components: (x: CGFloat, y: CGFloat)) {
        self.init(x: components.x, y: components.y)
    }
}

extension CGSize: CGVectorProtocol {
    public var components: (x: CGFloat, y: CGFloat) {
        return (width, height)
    }

    public init(components: (x: CGFloat, y: CGFloat)) {
        self.init(width: components.x, height: components.y)
    }
}

extension CGVector: CGVectorProtocol {
    public var components: (x: CGFloat, y: CGFloat) {
        return (dx, dy)
    }

    public init(components: (x: CGFloat, y: CGFloat)) {
        self.init(dx: components.x, dy: components.y)
    }
}

public extension CGVectorProtocol {
    /// Add two vectors, returning a new vector with the sum of their X & Y components
    /// Example: `CGPoint(x: 10, y: 20) + CGPoint(x: 20, y: 40) = CGPoint(x: 30, y: 60)`
    static func +(lhs: Self, rhs: CGVectorProtocol) -> Self {
        return lhs.applying(operator: +, with: rhs)
    }

    /// Subtract a vector from another, returning a new vector with the result of subtracting
    /// the right hand vector's components from the left hand vector's.
    /// Example: `CGPoint(x: 20, y: 30) - CGPoint(x: 5, y: 10) = CGPoint(x: 15, y: 20)`
    static func -(lhs: Self, rhs: CGVectorProtocol) -> Self {
        return lhs.applying(operator: -, with: rhs)
    }

    /// Return a new vector by multiplying a vector's components with a constant
    /// Example: `CGSize(width: 30, height: 90) * 3 = CGSize(width: 90, height: 270)
    static func *(lhs: Self, rhs: CGFloat) -> Self {
        return lhs.applying(operator: *, with: rhs)
    }

    /// Return a new vector by dividing a vector's components with a constant
    /// Example: `CGSize(width: 30, height: 90) / 3 = CGSize(width: 10, height: 30)`
    static func /(lhs: Self, rhs: CGFloat) -> Self {
        return lhs.applying(operator: /, with: rhs)
    }
}

private extension CGVectorProtocol {
    func applying(operator o: (CGFloat, CGFloat) -> CGFloat, with vector: CGVectorProtocol) -> Self {
        let lhsComponents = components
        let rhsComponents = vector.components
        return Self(components: (o(lhsComponents.x, rhsComponents.x),
                                 o(lhsComponents.y, rhsComponents.y)))
    }

    func applying(operator o: (CGFloat, CGFloat) -> CGFloat, with constant: CGFloat) -> Self {
        let components = self.components
        return Self(components: (o(components.x, constant), o(components.y, constant)))
    }
}
