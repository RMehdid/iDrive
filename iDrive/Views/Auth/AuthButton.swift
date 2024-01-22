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
            Spacer()
        }
        .padding(12)
        .background(Color("DVOrange"))
        .foregroundStyle(.white)
        .cornerRadius(8)
    }
}
