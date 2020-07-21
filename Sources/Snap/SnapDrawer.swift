
import SwiftUI

public struct SnapDrawer<StateType: SnapState, Content: View> : View {
    private let calculator: SnapPointCalculator<StateType>

    @Binding
    private var state: StateType

    private let content: (StateType.Visible) -> Content

    @State
    private var currentResult: SnapPointCalculator<StateType>.SnapResult

    @GestureState
    private var dragState = DragState.inactive

    init(snaps: [SnapPointCalculator<StateType>.Input], state: Binding<StateType>, content: @escaping (StateType.Visible) -> Content) {
        self.calculator = SnapPointCalculator(snaps: snaps)
        self._state = state
        self.content = content
        self._currentResult = State(initialValue: calculator(state: state.wrappedValue))
    }

    public var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)

        return ZStack {
            VStack {
                currentResult.state.visible.map { content($0).frame(height: currentResult.contentHeight) }
                Spacer()
            }
            
            VStack {
                Handle().padding(.top, 16)
                Spacer()
            }
        }
        .frame(height: UIScreen.main.bounds.height)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.9), radius: 10.0)
        .offset(y: self.currentResult.offset + self.dragState.translation.height)
        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
        .gesture(drag)
    }

    private func onDragEnded(drag: DragGesture.Value) {
        self.currentResult = calculator(current: currentResult, drag: drag)
    }
}

struct Handle : View {
    private let handleThickness = CGFloat(5.0)
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color.secondary)
            .padding(5)
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)

    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }

    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
