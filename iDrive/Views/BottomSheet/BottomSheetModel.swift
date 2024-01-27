//
//  BottomSheetModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 10/1/2024.
//

import Foundation

extension BottomSheet {
    @MainActor class ViewModel: ObservableObject {

        @Published private(set) var nearbyCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var favoritesCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var recentCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var searchCarsUiState: UiState<[SimpleCar]> = .idle
        @Published private(set) var userUiState: UiState<User> = .idle {
            willSet {
                guard case .success = newValue else {
                    return
                }

                self.loadCars()
            }
        }

        init() {
            if nil != UserDefaults.standard.accessToken {
                self.getUser()
            }
        }

        func loadCars() {
            guard case .success = userUiState else {
                return
            }

            self.getFavoritesCars()
            self.getRecentCars()
            self.getNearbyCars()
        }

        func getUser() {
            self.userUiState = .loading

            Task {
                do {
                    self.userUiState = .success(try await UserRepo.shared.getMe())
                } catch {
                    self.userUiState = .failure(.unAuthorized)
                }
            }
        }

        private func getNearbyCars() {
            self.nearbyCarsUiState = .loading

            Task {
                //                    self.nearbyCarsUiState = .success(Car.sampleCars)
            }
        }

        private func getFavoritesCars() {
            self.favoritesCarsUiState = .loading

            Task {
                self.favoritesCarsUiState = .success(try await CarRepo.shared.getFavoriteCars())
            }
        }

        private func getRecentCars() {
            self.recentCarsUiState = .loading

            Task {
                self.recentCarsUiState = .success(try await CarRepo.shared.getRecentCars())
            }
        }

        func searchCars(query: String) {
            self.searchCarsUiState = .loading

            Task {
                do {
                    let cars = try await CarRepo.shared.getCars(searchText: query)

                    self.searchCarsUiState = .success(cars)
                } catch {
                    self.searchCarsUiState = .failure(error as? DVError)
                }
            }
        }
    }
}
