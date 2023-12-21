//
//  HomeViewModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation

extension HomeView {
    final class ViewModel: ObservableObject {
        
        @Published private(set) var nearbyCarsUiState: UiState<[Car]> = .idle
        @Published private(set) var favoritesCarsUiState: UiState<[Car]> = .idle
        @Published private(set) var recentCarsUiState: UiState<[Car]> = .idle
        @Published private(set) var searchCarsUiState: UiState<[Car]> = .idle
        
        func getNearbyCars() {
            self.nearbyCarsUiState = .loading
            
            Task {
                DispatchQueue.main.async {
                    self.nearbyCarsUiState = .success(Car.sampleCars)
                }
            }
        }
        
        func getFavoritesCars() {
            self.favoritesCarsUiState = .loading
            
            Task {
                DispatchQueue.main.async {
                    self.favoritesCarsUiState = .success(Car.sampleCars)
                }
            }
        }
        
        func getRecentCars() {
            self.recentCarsUiState = .loading
            
            Task {
                DispatchQueue.main.async {
                    self.recentCarsUiState = .success(Car.sampleCars)
                }
            }
        }
        
        func searchCars(query: String) {
            self.searchCarsUiState = .loading
            
            Task {
                DispatchQueue.main.async {
                    self.searchCarsUiState = .success(Car.sampleCars)
                }
            }
        }
        
        
    }
}
