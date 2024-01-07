//
//  CarDetailsViewModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 23/12/2023.
//

import Foundation

extension CarDetailsSheet {
    class ViewModel: ObservableObject {
        
        @Published private(set) var carDetailsUiState: UiState<Car> = .idle
        
        func getCarDetails(_ carId: Int) {
            self.carDetailsUiState = .loading
            
            Task {
                do {
                    let car = try await CarRepo.shared.getCar(carId: carId)
                    
                    DispatchQueue.main.async {
                        self.carDetailsUiState = .success(car)
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.carDetailsUiState = .failure(error as? DVError)
                    }
                }
            }
        }
    }
}
