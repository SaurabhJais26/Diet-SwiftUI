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
    @State private var showFooter: Bool = false
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

            // Select All for Current Meal
            Toggle(isOn: Binding<Bool>(
                get: {
                    selectedRecipes.count == meal.recipes.count
                },
                set: { newValue in
                    if newValue {
                        selectedRecipes = Set(meal.recipes.map { $0.id })
                    } else {
                        selectedRecipes.removeAll()
                    }
                }
            )) {
                Text("Select All")
                    .font(.subheadline)
            }
            .toggleStyle(CheckboxToggleStyle())
            
            // Time Slot Checkboxes
            ForEach(meal.recipes, id: \.id) { recipe in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Toggle(isOn: Binding<Bool>(
                            get: { selectedRecipes.contains(recipe.id) },
                            set: { isSelected in
                                if isSelected {
                                    selectedRecipes.insert(recipe.id)
                                } else {
                                    selectedRecipes.remove(recipe.id)
                                }
                                isSelectAll = selectedRecipes.count == meal.recipes.count
                            }
                        )) {
                            Text(recipe.timeSlot) // Display the time slot
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                        .toggleStyle(CheckboxToggleStyle())
                    }
                    
                    // Recipes
                    MealCardView(recipe: recipe, showFooter: $showFooter)
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
                .padding(.vertical, 8)
            }
            
            if showFooter {
                VStack {
                    Spacer()
                    FooterView()
                        .padding()
                        .background(Color(.systemBackground))
                        .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: -2)
                }
                .edgesIgnoringSafeArea(.bottom)
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
            progressStatus: ProgressStatus(total: 2, completed: 1),
            recipes: [Recipe(id: 2, title: "Peach Rice Pudding 2", timeSlot: "13:00", duration: 30, image: "https://appfeatureimages.s3.amazonaws.com/recipes/Porridge.webp", isFavorite: 0, isCompleted: 1),
                      Recipe(id: 3, title: "Peach Rice Pudding 3", timeSlot: "14:00", duration: 30, image: "https://appfeatureimages.s3.amazonaws.com/recipes/Porridge.webp", isFavorite: 0, isCompleted: 0)
                     ]
        )
    )
}

