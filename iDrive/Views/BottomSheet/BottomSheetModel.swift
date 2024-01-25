//
//  BottomSheetModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 10/1/2024.
//

import Foundation

extension BottomSheet {
    class ViewModel: ObservableObject {

        @Published private(set) var nearbyCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var favoritesCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var recentCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var searchCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var userUiState: UiState<User> = .idle

        init() {
            self.getUser()
        }

        func getUser() {
            self.userUiState = .failure(.unAuthorized)
        }

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
