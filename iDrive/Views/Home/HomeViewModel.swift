//
//  HomeViewModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation

extension HomeView {
    final class ViewModel: ObservableObject {
        
        @Published private(set) var carsUiState: UiState<[Car]> = .idle
        
        func getCars() {
            self.carsUiState = .loading
            
            Task {
                DispatchQueue.main.async {
                    self.carsUiState = .success(Car.sampleCars)
                }
            }
        }
    }
}
