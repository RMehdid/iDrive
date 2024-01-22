//
//  AuthTextField.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/1/2024.
//

import SwiftUI

struct AuthTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(Color("DVDarkGray"))
            .cornerRadius(8)
    }
}
