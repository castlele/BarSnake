import SwiftUI

struct ToolBarView<Section: Pickable, IconFactory: IconFactoryProtocol, TitleFactory: TitleFactoryProtocol>: View {

    let spacing: CGFloat
    let sections: [Section]

    let iconFactory: IconFactory?
    let titleFactory: TitleFactory?

    @Binding var current: Int

    var selectedColor: Color = .secondary

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< sections.count) { index in
                sectionView(isSelected: index == current, section: sections[index])
                    .onTapGesture {
                        withAnimation {
                            current = index
                        }
                    }
                    .background {
                        VStack {
                            Spacer()

                            selectedColor
                            // TODO: make a constant
                                .frame(height: 2)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: Constants.defaultCornerRaduis))
                        .isHidden(current != index)
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, Constants.defaultInset)
    }

    private func sectionView(isSelected: Bool, section: Section) -> some View {
        let icon = iconFactory?.getIcon(with: section as! IconFactory.T, isSelected: isSelected)
        let title = titleFactory?.getTitle(with: section as! TitleFactory.T)

        return VStack {
            if let icon = icon {
                icon
                    .foregroundColor(.defaultFontColor)
            }

            if let title = title {
                title
                    .multilineTextAlignment(.center)
                    .foregroundColor(.defaultFontColor)
            }
        }
        .background(Color.clear)
    }
}
