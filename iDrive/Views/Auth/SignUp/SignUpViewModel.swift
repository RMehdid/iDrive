//
//  SignUpViewModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 23/1/2024.
//

import Foundation

extension SignUpView {
    @MainActor class ViewModel: ObservableObject {

        @Published private var idUiState: UiState<Void> = .idle
        @Published private var firstname: UiState<Void> = .idle
        @Published private var lastname: UiState<Void> = .idle
        @Published private var phoneUiState: UiState<Void> = .idle

        func signup(id: String, firstname: String, lastname: String, phone: String, finished: () -> Void) {

            Task {
                guard let id = Int(id) else {
                    self.idUiState = .failure(.custom("please enter your national id"))
                    return
                }

                UserDefaults.standard.accessToken = try await LoginRepo.shared.signUp(
                    user: Client(
                        id: id,
                        firstname: firstname,
                        lastname: lastname,
                        phone: phone,
                        rating: 5.0
                    )
                ).token
            }

            finished()
        }
    }
}
