
import Foundation

public protocol SnapState: Equatable {
    associatedtype Visible

    // State postfix was added until we upgrade to Swift 5.3 and get
    // Enum cases as protocol witnesses
    static var largeState: Self { get }
    static var invisibleState: Self { get }

    var visible: Visible? { get }
}

public enum ModalSnapState: SnapState {
    public enum Visible {
        case large
    }

    public static let largeState: ModalSnapState = .large
    public static let invisibleState: ModalSnapState = .invisible

    case large
    case invisible

    public var visible: Visible? {
        switch self {
        case .large:
            return .large
        case .invisible:
            return nil
        }
    }
}

public enum OvercastSnapState: SnapState {
    public enum Visible {
        case large
        case tiny
    }
    
    public static let largeState: OvercastSnapState = .large
    public static let invisibleState: OvercastSnapState = .invisible

    case large
    case tiny
    case invisible

    public var visible: Visible? {
        switch self {
        case .large:
            return .large
        case .tiny:
            return .tiny
        case .invisible:
            return nil
        }
    }
}

public enum AppleMapsSnapState: SnapState {
    public enum Visible {
        case large
        case medium
        case tiny
    }

    public static let largeState: AppleMapsSnapState = .large
    public static let invisibleState: AppleMapsSnapState = .invisible

    case large
    case medium
    case tiny
    case invisible

    public var visible: Visible? {
        switch self {
        case .large:
            return .large
        case .medium:
            return .medium
        case .tiny:
            return .tiny
        case .invisible:
            return nil
        }
    }
}
