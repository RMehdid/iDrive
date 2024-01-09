//
//  HomeView.swift
//  iDrive
//
//  Created by Samy Mehdid on 20/12/2023.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @StateObject private var locationManager = LocationManager.shared
    @StateObject private var viewModel = ViewModel()
    
    @State private var searchText: String = ""
    
    @State private var selectedCar: SimpleCar? = nil
    
    @State private var position: MapCameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
    
    @Namespace private var locationSpace
    
    var body: some View {
        Map(position: $position) {
            UserAnnotation()
//            ForEach(Car.sampleCars) { car in
//                Annotation(car.id, coordinate: car.location.coordinate) {
//                    Image("ic_car")
//                        .resizable()
//                        .frame(width: 24, height: 24)
//                }
//            }
        }
        .mapStyle(.standard)
        .mapControls {
            MapUserLocationButton()
        }
        .sheet(isPresented: .constant(true)) {
            GeometryReader { geometry in
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
                .presentationDetents([.medium, .large, .height(geometry.safeAreaInsets.bottom + 32)])
                .presentationBackgroundInteraction(.enabled)
                .presentationBackground(.ultraThinMaterial)
                .interactiveDismissDisabled()
                .sheet(item: $selectedCar){ car in
                    VStack {
                        Spacer()
                        CarDetailsSheet(car.id)
                    }
                    .padding()
                    .presentationBackground(.ultraThinMaterial)
                }
            }
        }
        .onAppear(perform: viewModel.getNearbyCars)
        .onAppear(perform: viewModel.getFavoritesCars)
        .onAppear(perform: viewModel.getRecentCars)
        .onChange(of: searchText, perform: viewModel.searchCars)
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
