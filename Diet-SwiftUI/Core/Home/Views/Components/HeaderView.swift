import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 16) { // Add spacing between sections
            HStack {
                // Back button aligned to the left
                Button {
                    // Handle back action
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }

                Spacer()
            }
            .padding(.horizontal)

            HStack {
                // Title and subtitle
                VStack(alignment: .leading, spacing: 4) { // Add spacing between title and subtitle
                    Text("Everyday Diet Plan")
                        .font(.title3.bold())
                        .foregroundColor(.primary)
                        .minimumScaleFactor(0.8) // Ensures text scales down if needed
                        .lineLimit(1)

                    Text("Track Ananya's every meal")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                        .minimumScaleFactor(0.8)
                        .lineLimit(1)
                }

                Spacer()

                // Grocery list button
                Button {
                    // Handle grocery list action
                } label: {
                    VStack {
                        Image(systemName: "cart")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            )
                        Text("Grocery List")
                            .font(.caption)
                            .foregroundColor(.primary)
                            .minimumScaleFactor(0.8)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

#Preview {
    Group {
        HeaderView()
            .previewDevice("iPhone SE (3rd generation)")
        HeaderView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
