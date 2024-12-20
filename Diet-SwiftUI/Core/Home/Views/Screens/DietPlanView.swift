//
//  DietPlanView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

import SwiftUI

struct DietPlanView: View {
    @StateObject private var viewModel = DietViewModel()
    @State private var showAlert = false

    var body: some View {
        ZStack {
            // Main Content
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
            .background(Color.theme.backgroundColor)

            // Progress View
            if viewModel.isLoading {
                ZStack {
                    Color(.systemBackground)
                        .ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .red))
                        .scaleEffect(2)
                }
            }
        }
        .task {
            await viewModel.fetchDiets()
        }
        .onChange(of: viewModel.errorMessage) { errorMessage in
            if errorMessage != nil {
                showAlert = true
            }
        }
        .overlay {
            DietAlertView(
                isPresented: $showAlert,
                title: "Something went wrong",
                message: viewModel.errorMessage ?? "Unknown error",
                buttonTitle: "Ok",
                onDismiss: {
                    viewModel.errorMessage = nil
                }
            )
        }
    }
}

#Preview {
    DietPlanView()
}


