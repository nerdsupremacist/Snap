
import SwiftUI

let handleVerticalPadding: CGFloat = 16
let handleThickness: CGFloat = 5

public struct SnapDrawer<StateType: SnapState, Background : View, Content: View> : View {
    private let calculator: SnapPointCalculator<StateType>

    private var state: Binding<StateType>?

    private let background: (StateType.Visible) -> Background
    private let content: (StateType.Visible) -> Content

    @State
    private var currentResult: SnapPointCalculator<StateType>.SnapResult {
        didSet {
            state?.wrappedValue = currentResult.state
        }
    }

    @GestureState
    private var dragState = DragState.inactive

    private var minDrag: CGFloat
    private var maxDrag: CGFloat

    init(snaps: [SnapPointCalculator<StateType>.Input],
         state: Binding<StateType>?,
         background: @escaping (StateType.Visible) -> Background,
         content: @escaping (StateType.Visible) -> Content) {

        self.calculator = SnapPointCalculator(snaps: snaps)
        self.state = state
        self.background = background
        self.content = content
        self._currentResult = State(initialValue: calculator(state: state?.wrappedValue ?? .largeState))
        self.minDrag = self.calculator.results.first?.offset ?? 0
        self.maxDrag = self.calculator.results.last?.offset ?? 0
    }

    public var body: some View {
        if let state = state, currentResult.state != state.wrappedValue {
            DispatchQueue.main.async {
                self.currentResult = self.calculator(state: state.wrappedValue)
            }
        }

        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)

        return ZStack {
            currentResult.state.visible.map { background($0).edgesIgnoringSafeArea(.all) }

            VStack(spacing: 0) {
                currentResult.state.visible != nil ? Handle() : nil
                currentResult.state.visible.map { content($0).frame(height: currentResult.contentHeight) }
                
                Spacer()
            }
        }
        .frame(height: UIScreen.main.bounds.height)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.9), radius: 10.0)
        .offset(y: min(maxDrag + 8, max(minDrag - 8, self.currentResult.offset + self.dragState.translation.height)))
        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
        .gesture(drag)
    }

    private func onDragEnded(drag: DragGesture.Value) {
        self.currentResult = calculator(current: currentResult, drag: drag)
    }
}

struct Handle : View {
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color.secondary)
            .padding(.vertical, handleVerticalPadding)
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
