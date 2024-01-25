//
//  iDriveApp.swift
//  iDrive
//
//  Created by Samy Mehdid on 20/12/2023.
//

import SwiftUI

@main
// swiftlint:disable type_name
struct iDriveApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .onAppear {
                    LocationManager.shared.requestLocation()
                }
        }
    }
}
// swiftlint:enable type_name
