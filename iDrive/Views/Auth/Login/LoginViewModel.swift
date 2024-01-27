//
//  LoginViewModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 23/1/2024.
//

import Foundation

extension LoginView {
    @MainActor class ViewModel: ObservableObject {

        @Published private var idUiState: UiState<Void> = .idle
        @Published private var phoneUiState: UiState<Void> = .idle

        func loginWithIdAndPhone(id: String, phone: String, finished: () -> Void) {
            Task {
                guard let id = Int(id) else {
                    self.idUiState = .failure(.custom("please enter your national id"))
                    return
                }

                UserDefaults.standard.accessToken = try await LoginRepo.shared.login(id: id, phone: phone).token

            }

            finished()
        }

        func loginWithProvider(_ provider: Provider) {
            switch provider {
            case .facebook:
                self.loginWithFacebook()
            case .google:
                self.loginWithGoogle()
            case .apple:
                self.loginWithApple()
            }
        }

        private func loginWithFacebook() {

        }

        private func loginWithGoogle() {

        }

        private func loginWithApple() {

        }
    }
}
