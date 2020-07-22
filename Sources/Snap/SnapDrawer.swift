
import SwiftUI

public struct SnapDrawer<StateType: SnapState, Background : View, Content: View> : View {
    private let calculator: SnapPointCalculator<StateType>

    @Binding
    private var state: StateType

    private let background: (StateType.Visible) -> Background
    private let content: (StateType.Visible) -> Content

    @State
    private var currentResult: SnapPointCalculator<StateType>.SnapResult = .zero {
        didSet {
            state = currentResult.state
        }
    }

    @GestureState
    private var dragState = DragState.inactive

    private var min: CGFloat

    init(snaps: [SnapPointCalculator<StateType>.Input],
         state: Binding<StateType>,
         background: @escaping (StateType.Visible) -> Background,
         content: @escaping (StateType.Visible) -> Content) {

        self.calculator = SnapPointCalculator(snaps: snaps)
        self._state = state
        self.background = background
        self.content = content
        self.min = self.calculator(state: .large).offset
    }

    public var body: some View {
        if currentResult.state != state {
            DispatchQueue.main.async {
                self.currentResult = self.calculator(state: state)
            }
        }

        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)

        return ZStack {
            currentResult.state.visible.map { background($0).edgesIgnoringSafeArea(.all) }

            VStack {
                currentResult.state.visible.map { content($0).frame(height: currentResult.contentHeight) }
                Spacer()
            }
            
            VStack {
                currentResult.state.visible != nil ? Handle().padding(.top, 16) : nil
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
