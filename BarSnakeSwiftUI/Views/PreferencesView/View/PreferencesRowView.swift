import SwiftUI

struct PreferencesRowView: View {

    let type: RowType

    @EnvironmentObject var viewModel: PreferencesViewModel

    private var pickerView: some View {
        Group {
            switch type {
            case .snakeColor:
                colorPickerView($viewModel.snakeColor)
            case .fieldColor:
                colorPickerView($viewModel.fieldColor)
            case .gridColor:
                colorPickerView($viewModel.gridColor)
            case .isGridHidden:
                toggleView($viewModel.isGridHidden, toggleStyle: .checkbox)
            case .fieldSize:
                pickerView($viewModel.fieldSizeType, title: viewModel.fieldSizeTitle)
            case .keyBindingType:
                pickerView($viewModel.keyBindingType)
                // TODO: refactor
            case .isScoreBoardSave:
                EmptyView()
            }
        }
    }

    var body: some View {
        HStack {
            Text(type.rawValue)

            Spacer()

            pickerView
        }
        .padding(.horizontal, .horizontalInset)
    }

    private func colorPickerView(_ color: Binding<CGColor>) -> some View {
        ColorPicker(String.empty, selection: color)
            .labelsHidden()
    }

    private func toggleView<Style: ToggleStyle>(_ value: Binding<Bool>,
                                                toggleStyle style: Style) -> some View {
        Toggle(String.empty, isOn: value)
            .toggleStyle(style)
            .labelsHidden()
    }

    private func pickerView<Value: Pickable>(_ selection: Binding<Value>,
                                             title: String? = nil) -> some View {
        Group {
            if let title = title {
                Picker(title, selection: selection) {
                    ForEach(Value.allCases, id: \.self) { value in
                        Text(value.rawValue)
                    }
                }
            } else {
                Picker(String.empty, selection: selection) {
                    ForEach(Value.allCases, id: \.self) { value in
                        Text(value.rawValue)
                    }
                }
                .labelsHidden()
            }
        }
    }
}

// MARK: - Constants

private extension CGFloat {
    static let horizontalInset: CGFloat = 15
}
