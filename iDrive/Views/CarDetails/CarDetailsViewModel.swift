//
//  CarDetailsViewModel.swift
//  iDrive
//
//  Created by Samy Mehdid on 23/12/2023.
//

import Foundation

extension CarDetailsView {
    class ViewModel: ObservableObject {
        
        @Published private(set) var packagesUiState: UiState<[Package]> = .idle
        
        func getPackages(carId: String) {
            let packages = [
                Package(id: 1,
                        name: "City Cruiser",
                        description: "Perfect for short periods and short distances inside the city. available for 2h, with a limit of 50km.",
                        pricing: Pricing(initialPrice: 700,
                                         initialPeriod: 2,
                                         initialDistance: 50,
                                         pricePerExtraHour: 50,
                                         pricePerExtraKm: 10)),
                
                Package(id: 2,
                        name: "Highway Voyager",
                        description: "Perfect for short periods and long distances across cities. available for 12h, with a limit of 400km.",
                        pricing: Pricing(initialPrice: 3000,
                                         initialPeriod: 12,
                                         initialDistance: 400,
                                         pricePerExtraHour: 50,
                                         pricePerExtraKm: 15)),
                
                Package(id: 3,
                        name: "Explorer Escape",
                        description: "Perfect for long periods and short distances inside the city. available for 24h, with a limit of 100km.",
                        pricing: Pricing(initialPrice: 5000,
                                         initialPeriod: 24,
                                         initialDistance: 100,
                                         pricePerExtraHour: 100,
                                         pricePerExtraKm: 10)),
                
                Package(id: 4,
                        name: "Epic Expedition",
                        description: "Perfect for vacations that takes longer periods and farther destinations. available for 7days. no distance limit.",
                        pricing: Pricing(initialPrice: 30000,
                                         initialPeriod: 168,
                                         initialDistance: 1000,
                                         pricePerExtraHour: 100,
                                         pricePerExtraKm: 20))
            ]
            self.packagesUiState = .success(packages)
        }
    }
}
