//
//  HomeView.swift
//  iDrive
//
//  Created by Samy Mehdid on 20/12/2023.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var searchText: String = ""
    
    var body: some View {
        Map {
//            if case .success(let nearbyCars) = viewModel.nearbyCarsUiState {
//                nearbyCars.map { Marker($0.name, coordinate: $0.coordinatesLocation.coordinate)}
//            } else {
//                Marker("", coordinate: CLLocationCoordinate2D(382.232, 232.232))
//            }
        }
        .overlay(alignment: .top){
            Rectangle()
                .fill(.ultraThinMaterial)
                .frame(height: 56)
        }
        .ignoresSafeArea()
        .sheet(isPresented: .constant(true)) {
            VStack(spacing: 16) {
                HStack(spacing: 16){
                    searchBar()
                    
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 42, height: 42)
                }
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    if !searchText.isEmpty, case .success(let searchedCars) = viewModel.searchCarsUiState {
                        listBuilder(for: "Search results", with: searchedCars)
                    } else {
                        if case .success(let nearbyCars) = viewModel.nearbyCarsUiState {
                            listBuilder(for: "Nearby cars", with: nearbyCars)
                        }
                        
                        Spacer()
                            .frame(height: 32)
                        
                        if case .success(let favoriteCars) = viewModel.favoritesCarsUiState {
                            listBuilder(for: "Favorite cars", with: favoriteCars)
                        }
                        
                        if case .success(let recentCars) = viewModel.recentCarsUiState {
                            listBuilder(for: "Recent cars", with: recentCars)
                        }
                    }
                }
            }
            .padding()
            .presentationDetents([.medium, .large, .height(96)])
            .presentationBackground(.ultraThinMaterial)
            .interactiveDismissDisabled()
        }
        .onAppear(perform: viewModel.getNearbyCars)
        .onAppear(perform: viewModel.getFavoritesCars)
        .onAppear(perform: viewModel.getRecentCars)
        .onChange(of: searchText, perform: viewModel.searchCars)
    }
    
    @ViewBuilder
    private func listBuilder(for title: String, with elements: [Car]) -> some View {
        VStack(alignment: .leading){
            Section {
                VStack(spacing: 0){
                    ForEach(elements.prefix(3)) { car in
                        CarCard(car)
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
}

#Preview {
    HomeView()
}
