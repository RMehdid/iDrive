//
//  AuthView.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/1/2024.
//

import SwiftUI

enum Provider: String, CaseIterable, Identifiable {
    var id: UUID { UUID() }
    
    case facebook
    case google
    case apple
}

struct LoginView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var id: String = ""
    @State private var phone: String = ""
    
    var signup: () -> Void
    
    var body: some View {
        VStack(spacing: 32){
            HStack{
                Button {
                    dismiss()
                } label: {
                    HStack{
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            
            Spacer()
            
            Image("Logo")
                .resizable()
                .frame(height: 176)
            
            Spacer()
            Spacer()
            
            VStack(spacing: 18){
                TextField(
                    "",
                    text: $id,
                    prompt:
                        Text("Enter id")
                        .foregroundStyle(Color("DVLightGray"))
                )
                .textFieldStyle(AuthTextField())
                
                TextField(
                    "",
                    text: $phone,
                    prompt:
                        Text("Enter phone")
                        .foregroundStyle(Color("DVLightGray"))
                )
                .textFieldStyle(AuthTextField())
            }
            
            Spacer()
            
            Button {
                viewModel.loginWithIdAndPhone(id: self.id, phone: self.phone) {
                    dismiss()
                }
            } label: {
                Text("Login")
            }
            .buttonStyle(AuthButtonStyle())
            
            HStack {
                Divider()
                    .frame(height: 1)
                    .overlay {
                        Color.white
                    }
                Text("Or sign up with")
                Divider()
                    .frame(height: 1)
                    .overlay {
                        Color.white
                    }
            }
            
            HStack(spacing: 28){
                ForEach(Provider.allCases) {
                    labelBuilder(for: $0)
                }
            }
            
            Spacer()
            Spacer()
        }
        .padding()
        .foregroundStyle(.white)
        .background {
            Image("backgroundPattern")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.1)
        }
        .background(.black.gradient)
    }
    
    @ViewBuilder
    private func labelBuilder(for provider: Provider) -> some View {
        Button {
            // open sdk to authenticate, when work is done, redirect to fill necissary informations on signup
            viewModel.loginWithProvider(provider)
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 60, height: 40)
                .overlay {
                    Image(provider.rawValue)
                        .resizable()
                        .frame(width: 28, height: 28)
                }
        }
    }
}

#Preview {
    LoginView {
        
    }
}
