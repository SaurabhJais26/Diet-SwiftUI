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
    @State private var isSelectAll = false // Track selection state

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Main Content
                ScrollView {
                    VStack(spacing: 16) {
                        HeaderView()
                        DietStreakView()
                        SearchBarView()

                        ForEach(viewModel.diets, id: \.daytime) { meal in
                            MealSectionView(isSelectAll: $isSelectAll, meal: meal)
                                .frame(maxWidth: geometry.size.width * 0.9)
                        }
                        .padding(.horizontal, geometry.size.width * 0.05)
                    }
                }
                .background(Color.theme.backgroundColor)

                // Footer View
                if isSelectAll {
                    VStack {
                        Spacer()
                        FooterView()
                            .padding()
                            .background(Color(.systemBackground))
                            .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: -2)
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }

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
}


#Preview {
    DietPlanView()
}

