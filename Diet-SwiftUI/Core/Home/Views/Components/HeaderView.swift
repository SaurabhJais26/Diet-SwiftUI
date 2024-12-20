//
//  HeaderView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 20/12/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                // Back button aligned to the left
                Button {
                    // Handle back action
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(8)
                        .background(Circle().stroke(Color.gray, lineWidth: 1))
                }

                Spacer()
            }
            .padding(.horizontal)

            HStack {
                // Title and subtitle
                VStack(alignment: .leading) {
                    Text("Everyday Diet Plan")
                        .font(.title3.bold())
                    Text("Track Ananya's every meal")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(Color(.systemGray))
                }

                Spacer()

                // Grocery list button
                Button {
                    // Handle grocery list action
                } label: {
                    VStack {
                        Image(systemName: "cart")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        Text("Grocery List")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

#Preview {
    HeaderView()
}
