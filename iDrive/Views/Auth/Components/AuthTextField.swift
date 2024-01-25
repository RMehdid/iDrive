//
//  AuthTextField.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/1/2024.
//

import SwiftUI

struct AuthTextField: TextFieldStyle {
    // swiftlint:disable identifier_name
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
    }
    // swiftlint:enable identifier_name
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        TextField(
            "",
            text: .constant(""),
            prompt:
                Text("Enter id")
                .foregroundStyle(Color("DVLightGray"))
        )
        .textFieldStyle(AuthTextField())
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
