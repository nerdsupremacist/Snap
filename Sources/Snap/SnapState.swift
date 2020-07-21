
import Foundation

public protocol SnapState: Equatable {
    associatedtype Visible

    static var large: Self { get }
    static var invisible: Self { get }

    var visible: Visible? { get }
}

public enum ModalSnapState: SnapState {
    public enum Visible {
        case large
    }

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
