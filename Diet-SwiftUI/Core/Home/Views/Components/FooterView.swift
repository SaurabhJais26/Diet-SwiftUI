//
//  FooterView.swift
//  Diet-SwiftUI
//
//  Created by Saurabh Jaiswal on 21/12/24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack(spacing: 16.0){
            fedButtonView()
            
            cancelButtonView()
        }
    }
    
    private func fedButtonView() -> some View{
        Text("Fed?")
            .foregroundColor(Color.white)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 40.0)
            .padding(.vertical, 6.0)
            .padding(.horizontal, 9.5)
            .background(Color(red: 76.0/255.0, green: 88.0/255.0, blue: 217.0/255.0))
            .cornerRadius(33.0)
    }
    
    private func cancelButtonView() -> some View{
        Text("Cancel")
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 40.0)
            .padding(.vertical, 6.0)
            .padding(.horizontal, 9.5)
            .cornerRadius(33.0)
            .overlay {
                RoundedRectangle(cornerRadius: 33.0)
                    .stroke(Color.black, lineWidth: 1.0)
            }
    }
}

#Preview {
    FooterView()
}
