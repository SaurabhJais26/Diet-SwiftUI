//
//  MealSectionView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

//
//  MealSectionView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

import SwiftUI

struct MealSectionView: View {
    @Binding var isSelectAll: Bool
    @State private var selectedRecipes: Set<Int> = [] // Track selected recipes
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
                .frame(width: 70, height: 70)
            }

            // Select All
            Toggle(isOn: $isSelectAll) {
                Text("Select All")
                    .font(.subheadline)
            }
            .toggleStyle(CheckboxToggleStyle())
            .onChange(of: isSelectAll) { newValue in
                if newValue {
                    selectedRecipes = Set(meal.recipes.map { $0.id }) // Select all recipes
                } else {
                    selectedRecipes.removeAll() // Deselect all recipes
                }
            }

            // Recipes
            ForEach(meal.recipes, id: \.id) { recipe in
                MealCardView(recipe: recipe)
                    .background(
                        selectedRecipes.contains(recipe.id) ? Color.gray.opacity(0.2) : Color.clear
                    )
                    .onTapGesture {
                        if selectedRecipes.contains(recipe.id) {
                            selectedRecipes.remove(recipe.id)
                        } else {
                            selectedRecipes.insert(recipe.id)
                        }

                        isSelectAll = selectedRecipes.count == meal.recipes.count
                    }
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
}



// Checkbox Toggle Style
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Button(action: {
                configuration.isOn.toggle() // Toggle state on click
            }) {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? Color("PurpleBlue") : .primary)
                    .font(.title3) // Adjust size of checkbox
            }
            configuration.label
        }
    }
}

#Preview {
    MealSectionView(
        isSelectAll: .constant(false), meal: AllDiet(
            daytime: "Morning Meals",
            timings: "6AM - 11:59AM",
            progressStatus: ProgressStatus(total: 3, completed: 1),
            recipes: []
        )
    )
}

