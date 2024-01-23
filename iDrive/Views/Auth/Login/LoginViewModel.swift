//
//  LoginViewModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 23/1/2024.
//

import Foundation

extension LoginView {
    @MainActor class ViewModel: ObservableObject {
        
        func loginWithIdAndPhone(id: String, phone: String, finished: () -> Void) {
            // get user from auth
            
//            let user = Client.sampleClient
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
