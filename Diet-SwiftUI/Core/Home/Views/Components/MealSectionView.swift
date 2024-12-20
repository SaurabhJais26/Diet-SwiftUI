//
//  MealSectionView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

import SwiftUI
 
struct MealSectionView: View {
    let meal: AllDiet
 
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(meal.daytime)
                        .font(.headline)
                    Text(meal.timings)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
 
                Spacer()
 
                // Circular Progress
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 6)
                    Circle()
                        .trim(from: 0, to: CGFloat(meal.progressStatus.completed) / CGFloat(meal.progressStatus.total))
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                        .rotationEffect(.degrees(-90))
 
                    VStack {
                        Text("Status")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("\(meal.progressStatus.completed) of \(meal.progressStatus.total)")
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                }
                .frame(width: 70, height: 70) // Increased size
            }
 
            // Select All
            Toggle(isOn: .constant(false)) {
                Text("Select All")
                    .font(.subheadline)
            }
            .toggleStyle(CheckboxToggleStyle())
 
            // Recipes
            ForEach(meal.recipes, id: \.id) { recipe in
                MealCardView(recipe: recipe)
            }
        }
        .padding()
    }
}
 
// Checkbox Toggle Style
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Button(action: {
                configuration.isOn.toggle()
            }) {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(.black)
                    .font(.title3) // Adjust size of checkbox
            }
            configuration.label
        }
    }
}
 
#Preview {
    MealSectionView(
        meal: AllDiet(
            daytime: "Morning Meals",
            timings: "6AM - 11:59AM",
            progressStatus: ProgressStatus(total: 3, completed: 1),
            recipes: []
        )
    )
}
