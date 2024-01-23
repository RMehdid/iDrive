//
//  BottomSheet.swift
//  iDrive
//
//  Created by Samy Mehdid on 10/1/2024.
//

import SwiftUI

struct BottomSheet: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var searchText: String = ""
    
    @State private var selectedCar: SimpleCar? = nil
    
    @State private var isLoggingIn = false
    @State private var isSigningUp = false
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16){
                searchBar()
                
                if case .success(let user) = viewModel.userUiState {
                    if let profileImage = user.profileImageUrl {
                         
                    } else {
                        Text(user.namePlaceholderForImage)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.white)
                            .background {
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 42, height: 42)
                            }
                    }
                } else if case .failure(let error) = viewModel.userUiState, error == .unAuthorized {
                    Button {
                        self.isLoggingIn = true
                    } label: {
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 42, height: 36)
                    }
                    .buttonStyle(PlainButtonStyle())
                } else {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 42, height: 42)
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                Spacer()
                    .frame(height: 32)
                
                if !searchText.isEmpty, case .success(let searchedCars) = viewModel.searchCarsUiState {
                    listBuilder(for: "Search results", with: searchedCars)
                } else {
                    if case .success(let nearbyCars) = viewModel.nearbyCarsUiState {
                        listBuilder(for: "Nearby cars", with: nearbyCars)
                    }
                    
                    if case .success(let favoriteCars) = viewModel.favoritesCarsUiState {
                        listBuilder(for: "Favorite cars", with: favoriteCars)
                    }
                    
                    if case .success(let recentCars) = viewModel.recentCarsUiState {
                        listBuilder(for: "Recent cars", with: recentCars)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
        .onAppear(perform: viewModel.getNearbyCars)
        .onAppear(perform: viewModel.getFavoritesCars)
        .onAppear(perform: viewModel.getRecentCars)
        .onChange(of: searchText, perform: viewModel.searchCars)
        .sheet(item: $selectedCar){ car in
            VStack {
                Spacer()
                CarDetailsSheet(car.id)
            }
            .padding()
            .presentationBackground {
                Image("backgroundPattern")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.1)
                    .background(Color.black.gradient)
            }
        }
        .fullScreenCover(isPresented: $isLoggingIn) {
            LoginView {
                self.isSigningUp = true
            }
        }
        .fullScreenCover(isPresented: $isSigningUp) {
            SignUpView()
        }
    }
    
    @ViewBuilder
    private func searchBar() -> some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Find Best car", text: $searchText)
            Spacer()
            if !searchText.isEmpty {
                Button {
                    self.searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(.ultraThickMaterial)
        }
    }
    
    @ViewBuilder
    private func listBuilder(for title: String, with elements: [SimpleCar]) -> some View {
        VStack(alignment: .leading){
            Section {
                VStack(spacing: 0){
                    ForEach(elements.prefix(3)) { car in
                        Button {
                            self.selectedCar = car
                        } label: {
                            CarCard(car)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .background(.ultraThickMaterial)
                .clipShape(.rect(cornerRadius: 16))
            } header: {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
            }
        }
    }
}

#Preview {
    BottomSheet()
}
