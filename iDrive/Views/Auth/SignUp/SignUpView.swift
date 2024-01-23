//
//  SignUp.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/1/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var id: String = ""
    @State private var phone: String = ""
    
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
                viewModel.signup(id: self.id, phone: self.phone)
            } label: {
                Text("Sign up")
            }
            .buttonStyle(AuthButtonStyle())
        }
        .padding()
        .foregroundStyle(.white)
        .background {
            Image("backgroundPattern")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.2)
        }
        .background(.black.gradient)
    }
}

#Preview {
    SignUpView()
}
