//
//  MealCardView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

import SwiftUI
 
struct MealCardView: View {
    let recipe: Recipe
 
    var body: some View {
        ZStack {
            // Background
            HStack(spacing: 12) {
                // Image
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(width: 110, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
 
                // Recipe Details and Buttons
                VStack(alignment: .leading, spacing: 8) {
                    // Title and Duration
                    Text(recipe.title)
                        .font(.headline)
                        .lineLimit(1)
 
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("\(recipe.duration) mins")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
 
                    Spacer()
                    
                    Divider()
 
                    // Buttons
                    HStack(spacing: 12) {
                        Button(action: {
                            // Customize action
                        }) {
                            Label("Customize", systemImage: "arrow.left.arrow.right.circle")
                                .font(.caption)
                                .padding(8)
                                .frame(width: 110)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
 
                        Button(action: {
                            // Fed? action
                        }) {
                            Label("Fed?", systemImage: "checkmark.circle")
                                .font(.caption)
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.gray)
                                .clipShape(Capsule())
                        }
                    }
                }
                .frame(maxHeight: .infinity)
 
                Spacer()
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
 
            // Heart Icon
            HStack {
                Spacer()
                VStack {
                    Image(systemName: recipe.isFavorite == 1 ? "heart.fill" : "heart")
                        .foregroundColor(recipe.isFavorite == 1 ? .red : .gray)
                        .padding()
                    Spacer()
                }
            }
        }
    }
}
 
#Preview {
    MealCardView(recipe: Recipe(
        id: 1,
        title: "Peach Rice Pudding",
        timeSlot: "06:00",
        duration: 30,
        image: "https://appfeatureimages.s3.amazonaws.com/recipes/Porridge.webp",
        isFavorite: 0,
        isCompleted: 1
    ))
}


