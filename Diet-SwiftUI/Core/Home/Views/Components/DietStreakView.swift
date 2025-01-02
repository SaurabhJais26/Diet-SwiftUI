//
//  DietStreakView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

import SwiftUI

struct DietStreakView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Diet Streak")
                    .font(.headline)
                    .bold()
                
                Spacer()
                
                Button {
                    // Handle streak info action
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.blue)
                        Text("1 Streak")
                            .font(.caption)
                            .foregroundColor(.primary)
                            .bold()
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                }

            }
            
            HStack(spacing: 40) {
                VStack {
                    Text("Morning")
                        .font(.subheadline)
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                }
                
                VStack {
                    Text("Afternoon")
                        .font(.subheadline)
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.title2)
                }
                
                VStack {
                    Text("Evening")
                        .font(.subheadline)
                    Image(systemName: "largecircle.fill.circle")
                        .foregroundColor(.green)
                        .font(.title2)
                }
                
                VStack {
                    Text("Night")
                        .font(.subheadline)
                    Image(systemName: "largecircle.fill.circle")
                        .foregroundColor(.secondary)
                        .font(.title2)
                }
            }
            .frame(maxWidth: .infinity)
            
        }
        .padding()
        .background(Color("LightSpringGreen"))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color("LightSpringGreen").opacity(0.1), lineWidth: 2)
        )
        .padding(.horizontal)
    }
}

#Preview {
    DietStreakView()
}
