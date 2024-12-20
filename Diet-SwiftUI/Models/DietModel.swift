//
//  DietModel.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 19/12/24.
//

import Foundation

// MARK: - DietModel
struct DietModel: Codable {
    let status, message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let diets: Diets
}

// MARK: - Diets
struct Diets: Codable {
    let dietStreak: [String]
    let allDiets: [AllDiet]
}

// MARK: - AllDiet
struct AllDiet: Codable {
    let daytime, timings: String
    let progressStatus: ProgressStatus
    let recipes: [Recipe]
}

// MARK: - ProgressStatus
struct ProgressStatus: Codable {
    let total, completed: Int
}

// MARK: - Recipe
struct Recipe: Codable {
    let id: Int
    let title, timeSlot: String
    let duration: Int
    let image: String
    let isFavorite, isCompleted: Int
}
