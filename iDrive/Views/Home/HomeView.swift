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
                BottomSheet()
                    .presentationDetents([.medium, .large, .height(geometry.safeAreaInsets.bottom + 32)])
//                    .presentationBackgroundInteraction(.enabled)
                    .presentationBackground(.ultraThinMaterial)
                    .interactiveDismissDisabled()
            }
        }
    }
}

#Preview {
    HomeView()
}
