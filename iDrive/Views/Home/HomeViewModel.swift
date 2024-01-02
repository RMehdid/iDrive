//
//  HomeViewModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation

extension HomeView {
    final class ViewModel: ObservableObject {
        
        @Published private(set) var nearbyCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var favoritesCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var recentCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var searchCarsUiState: UiState<[SimpleCar]> = .idle
        
        func getNearbyCars() {
            self.nearbyCarsUiState = .loading
            
            Task {
                DispatchQueue.main.async {
//                    self.nearbyCarsUiState = .success(Car.sampleCars)
                }
            }
        }
        
        func getFavoritesCars() {
            self.favoritesCarsUiState = .loading
            
            Task {
                DispatchQueue.main.async {
//                    self.favoritesCarsUiState = .success(Car.sampleCars)
                }
            }
        }
        
        func getRecentCars() {
            self.recentCarsUiState = .loading
            
            Task {
                DispatchQueue.main.async {
//                    self.recentCarsUiState = .success(Car.sampleCars)
                }
            }
        }
        
        func searchCars(query: String) {
            self.searchCarsUiState = .loading
            
            Task {
                do {
                    let cars = try await CarRepo.shared.getCars(searchText: query)
                    
                    DispatchQueue.main.async {
                        self.searchCarsUiState = .success(cars)
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.searchCarsUiState = .failure(error as? DVError)
                    }
                }
            }
        }
    }
}
