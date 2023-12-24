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
        @Published private(set) var ownerUiState: UiState<Owner> = .idle
        
        func getPackages(carId: String) {
            let packages = [
                Package(id: 1,
                        name: "City Cruiser",
                        description: "Perfect for short periods and short distances inside the city. available for 2h, with a limit of 50km.",
                        initialPeriod: 7200,
                        initialDistance: 50,
                        pricing: Pricing(initialPrice: 700,
                                         pricePerExtraHour: 50,
                                         pricePerExtraKm: 10)),
                
                Package(id: 2,
                        name: "Highway Voyager",
                        description: "Perfect for short periods and long distances across cities. available for 12h, with a limit of 400km.",
                        initialPeriod: 43200,
                        initialDistance: 400,
                        pricing: Pricing(initialPrice: 3000,
                                         pricePerExtraHour: 50,
                                         pricePerExtraKm: 15)),
                
                Package(id: 3,
                        name: "Explorer Escape",
                        description: "Perfect for long periods and short distances inside the city. available for 24h, with a limit of 100km.",
                        initialPeriod: 86400,
                        initialDistance: 100,
                        pricing: Pricing(initialPrice: 5000,
                                         pricePerExtraHour: 100,
                                         pricePerExtraKm: 10)),
                
                Package(id: 4,
                        name: "Epic Expedition",
                        description: "Perfect for vacations that takes longer periods and farther destinations. available for 7days. no distance limit.",
                        initialPeriod: 604800,
                        initialDistance: 1000,
                        pricing: Pricing(initialPrice: 30000,
                                         pricePerExtraHour: 100,
                                         pricePerExtraKm: 20))
            ]
            self.packagesUiState = .success(packages)
        }
        
        func getOwner(ownerId: String) {
            let owner = Owner(id: "1", username: "raynex", firstname: "Samy Abderraouf", lastname: "Mehdid", email: "samy.mhd16@gmail.com", phone: "+213540408051", profileImageUrl: "profile_placeholder", rating: 4.4)
            
            ownerUiState = .success(owner)
        }
    }
}
