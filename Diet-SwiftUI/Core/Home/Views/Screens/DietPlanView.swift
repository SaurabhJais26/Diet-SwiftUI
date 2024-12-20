//
//  DietPlanView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

import SwiftUI

struct DietPlanView: View {
    @StateObject private var viewModel = DietViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HeaderView()
                DietStreakView()
                SearchBarView()

                ForEach(viewModel.diets, id: \.daytime) { meal in
                    MealSectionView(meal: meal)
                }
            }
        }
        .task {
            await viewModel.fetchDiets()
        }
    }
}


#Preview {
    DietPlanView()
}

