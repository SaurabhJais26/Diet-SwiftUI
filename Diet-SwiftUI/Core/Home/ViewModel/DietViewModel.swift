//
//  DietViewModel.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

import Foundation
import Combine
import SwiftUI

class DietViewModel: ObservableObject {
    @Published var diets: [AllDiet] = []
    @Published var dietStreak: [String] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchDiets() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        guard let url = URL(string: "https://uptodd.com/fetch-all-diets") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let dietResponse = try JSONDecoder().decode(DietModel.self, from: data)
            DispatchQueue.main.async {
                self.diets = dietResponse.data.diets.allDiets
                self.dietStreak = dietResponse.data.diets.dietStreak
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to load diets: \(error.localizedDescription)"
                self.isLoading = false
            }
        }
    }
}

