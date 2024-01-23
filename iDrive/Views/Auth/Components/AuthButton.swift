//
//  AuthButton.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/1/2024.
//

import SwiftUI

struct AuthButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            Spacer()
            configuration.label
                .font(.system(size: 18, weight: .medium))
            Spacer()
        }
        .padding(12)
        .background(Color("DVOrange"))
        .foregroundStyle(.white)
        .cornerRadius(8)
    }
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            
        } label: {
            Text("Sign up")
        }
        .buttonStyle(AuthButtonStyle())
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
