//
//  SearchBarView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

import SwiftUI
 
struct SearchBarView: View {
    @State private var searchText: String = ""
 
    var body: some View {
        HStack {
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search Meals", text: $searchText)
                    .foregroundColor(.primary)
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
 
            // Filter Button
            Button(action: {
                // Handle filter action
            }) {
                Image(systemName: "slider.horizontal.3") // Different icon for the filter
                    .font(.title2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}
 
#Preview {
    SearchBarView()
}
