
import SwiftUI

public enum SnapPoint {
    case height(CGFloat)
    case paddingToTop(CGFloat)
    case fraction(CGFloat)
}

extension SnapPoint : ExpressibleByIntegerLiteral {

    public init(integerLiteral value: CGFloat.IntegerLiteralType) {
        self = .height(CGFloat(integerLiteral: value))
    }

}

extension SnapPoint : ExpressibleByFloatLiteral {

    public init(floatLiteral value: CGFloat.FloatLiteralType) {
        self = .height(CGFloat(floatLiteral: value))
    }

}
