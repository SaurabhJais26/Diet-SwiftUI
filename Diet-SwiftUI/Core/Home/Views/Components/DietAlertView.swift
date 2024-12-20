//
//  DietAlertView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 21/12/24.
//

import SwiftUI

struct DietAlertView: View {
    @Binding var isPresented: Bool
    var title: String
    var message: String
    var buttonTitle: String = "OK"
    var onDismiss: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            if isPresented {
                // Background dimming
                Color.black.opacity(0.75)
                    .ignoresSafeArea()
                
                // Alert container
                VStack(spacing: 20) {
                    Text(title)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    
                    Text(message)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Button(action: {
                        isPresented = false
                        onDismiss?()
                    }) {
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text(buttonTitle)
                        }
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                }
                .frame(width: 280)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 10)
            }
        }
        .animation(.easeInOut, value: isPresented)
    }
}


