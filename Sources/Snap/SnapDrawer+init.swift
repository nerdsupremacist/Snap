
import Foundation
import SwiftUI

extension SnapDrawer where StateType == ModalSnapState {

    public init(state: Binding<StateType>,
                large: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping (StateType.Visible) -> Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        let snaps = [
            SnapPointCalculator<StateType>.Input(state: .large, point: large),
            allowInvisible ? SnapPointCalculator<StateType>.Input(state: .invisible, point: .height(0)) : nil
        ].compactMap { $0 }

        self.init(snaps: snaps, state: state, background: background, content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping () -> Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, allowInvisible: allowInvisible, background: { _ in background() }) { _ in content() }
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(state: state, large: large, allowInvisible: allowInvisible, background: { _ in background }, content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, allowInvisible: allowInvisible, background: background) { _ in content() }
    }
    
}

extension SnapDrawer where StateType == ModalSnapState, Background == Color {

    public init(state: Binding<StateType>,
                large: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(state: state, large: large, allowInvisible: allowInvisible, background: backgroundColor, content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, allowInvisible: allowInvisible, backgroundColor: backgroundColor) { _ in content() }
    }


}

extension SnapDrawer where StateType == ModalSnapState, Background == BlurView {

    public init(state: Binding<StateType>,
                large: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(state: state, large: large, allowInvisible: allowInvisible, background: BlurView(), content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, allowInvisible: allowInvisible) { _ in content() }
    }


}

extension SnapDrawer where StateType == OvercastSnapState {

    public init(state: Binding<StateType>,
                large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping (StateType.Visible) -> Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        let snaps = [
            SnapPointCalculator<StateType>.Input(state: .large, point: large),
            SnapPointCalculator<StateType>.Input(state: .tiny, point: tiny),
            allowInvisible ? SnapPointCalculator<StateType>.Input(state: .invisible, point: .height(0)) : nil
        ].compactMap { $0 }

        self.init(snaps: snaps, state: state, background: background, content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping () -> Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, tiny: tiny, allowInvisible: allowInvisible, background: { _ in background() }) { _ in content() }
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(state: state, large: large, tiny: tiny, allowInvisible: allowInvisible, background: { _ in background }, content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, tiny: tiny, allowInvisible: allowInvisible, background: background) { _ in content() }
    }

}

extension SnapDrawer where StateType == OvercastSnapState, Background == Color {

    public init(state: Binding<StateType>,
                large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(state: state, large: large, tiny: tiny, allowInvisible: allowInvisible, background: backgroundColor, content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, tiny: tiny, allowInvisible: allowInvisible, backgroundColor: backgroundColor) { _ in content() }
    }


}

extension SnapDrawer where StateType == OvercastSnapState, Background == BlurView {

    public init(state: Binding<StateType>,
                large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(state: state, large: large, tiny: tiny, allowInvisible: allowInvisible, background: BlurView(), content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, tiny: tiny, allowInvisible: allowInvisible) { _ in content() }
    }


}

extension SnapDrawer where StateType == AppleMapsSnapState {

    public init(state: Binding<StateType>,
                large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping (StateType.Visible) -> Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        let snaps = [
            SnapPointCalculator<StateType>.Input(state: .large, point: large),
            SnapPointCalculator<StateType>.Input(state: .medium, point: medium),
            SnapPointCalculator<StateType>.Input(state: .tiny, point: tiny),
            allowInvisible ? SnapPointCalculator<StateType>.Input(state: .invisible, point: .height(0)) : nil
        ].compactMap { $0 }

        self.init(snaps: snaps, state: state, background: background, content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping () -> Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: { _ in background() }) { _ in content() }
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(state: state, large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: { _ in background }, content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: background) { _ in content() }
    }

}

extension SnapDrawer where StateType == AppleMapsSnapState, Background == Color {

    public init(state: Binding<StateType>,
                large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(state: state, large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: backgroundColor, content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, backgroundColor: backgroundColor) { _ in content() }
    }


}

extension SnapDrawer where StateType == AppleMapsSnapState, Background == BlurView {

    public init(state: Binding<StateType>,
                large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(state: state, large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: BlurView(), content: content)
    }

    public init(state: Binding<StateType>,
                large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(state: state, large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible) { _ in content() }
    }

}

// Without State

extension SnapDrawer where StateType == ModalSnapState {

    public init(large: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping (StateType.Visible) -> Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        let snaps = [
            SnapPointCalculator<StateType>.Input(state: .large, point: large),
            allowInvisible ? SnapPointCalculator<StateType>.Input(state: .invisible, point: .height(0)) : nil
        ].compactMap { $0 }

        self.init(snaps: snaps, state: nil, background: background, content: content)
    }

    public init(large: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping () -> Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, allowInvisible: allowInvisible, background: { _ in background() }) { _ in content() }
    }

    public init(large: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(large: large, allowInvisible: allowInvisible, background: { _ in background }, content: content)
    }

    public init(large: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, allowInvisible: allowInvisible, background: background) { _ in content() }
    }

}

extension SnapDrawer where StateType == ModalSnapState, Background == Color {

    public init(large: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(large: large, allowInvisible: allowInvisible, background: backgroundColor, content: content)
    }

    public init(large: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, allowInvisible: allowInvisible, backgroundColor: backgroundColor) { _ in content() }
    }


}

extension SnapDrawer where StateType == ModalSnapState, Background == BlurView {

    public init(large: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(large: large, allowInvisible: allowInvisible, background: BlurView(), content: content)
    }

    public init(large: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, allowInvisible: allowInvisible) { _ in content() }
    }


}

extension SnapDrawer where StateType == OvercastSnapState {

    public init(large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping (StateType.Visible) -> Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        let snaps = [
            SnapPointCalculator<StateType>.Input(state: .large, point: large),
            SnapPointCalculator<StateType>.Input(state: .tiny, point: tiny),
            allowInvisible ? SnapPointCalculator<StateType>.Input(state: .invisible, point: .height(0)) : nil
        ].compactMap { $0 }

        self.init(snaps: snaps, state: nil, background: background, content: content)
    }

    public init(large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping () -> Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, tiny: tiny, allowInvisible: allowInvisible, background: { _ in background() }) { _ in content() }
    }

    public init(large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(large: large, tiny: tiny, allowInvisible: allowInvisible, background: { _ in background }, content: content)
    }

    public init(large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, tiny: tiny, allowInvisible: allowInvisible, background: background) { _ in content() }
    }

}

extension SnapDrawer where StateType == OvercastSnapState, Background == Color {

    public init(large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(large: large, tiny: tiny, allowInvisible: allowInvisible, background: backgroundColor, content: content)
    }

    public init(large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, tiny: tiny, allowInvisible: allowInvisible, backgroundColor: backgroundColor) { _ in content() }
    }


}

extension SnapDrawer where StateType == OvercastSnapState, Background == BlurView {

    public init(large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(large: large, tiny: tiny, allowInvisible: allowInvisible, background: BlurView(), content: content)
    }

    public init(large: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, tiny: tiny, allowInvisible: allowInvisible) { _ in content() }
    }


}

extension SnapDrawer where StateType == AppleMapsSnapState {

    public init(large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping (StateType.Visible) -> Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        let snaps = [
            SnapPointCalculator<StateType>.Input(state: .large, point: large),
            SnapPointCalculator<StateType>.Input(state: .medium, point: medium),
            SnapPointCalculator<StateType>.Input(state: .tiny, point: tiny),
            allowInvisible ? SnapPointCalculator<StateType>.Input(state: .invisible, point: .height(0)) : nil
        ].compactMap { $0 }

        self.init(snaps: snaps, state: nil, background: background, content: content)
    }

    public init(large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder background: @escaping () -> Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: { _ in background() }) { _ in content() }
    }

    public init(large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: { _ in background }, content: content)
    }

    public init(large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                background: Background,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: background) { _ in content() }
    }

}

extension SnapDrawer where StateType == AppleMapsSnapState, Background == Color {

    public init(large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: backgroundColor, content: content)
    }

    public init(large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                backgroundColor: Color,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, backgroundColor: backgroundColor) { _ in content() }
    }


}

extension SnapDrawer where StateType == AppleMapsSnapState, Background == BlurView {

    public init(large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping (StateType.Visible) -> Content) {

        self.init(large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible, background: BlurView(), content: content)
    }

    public init(large: SnapPoint,
                medium: SnapPoint,
                tiny: SnapPoint,
                allowInvisible: Bool = true,
                @ViewBuilder content: @escaping () -> Content) {

        self.init(large: large, medium: medium, tiny: tiny, allowInvisible: allowInvisible) { _ in content() }
    }

}

