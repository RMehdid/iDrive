//
//  CarDetailsView.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import SwiftUI

struct CarDetailsSheet: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var showSheet: Car?
    @State private var sheetHeight: CGFloat = .zero
    
    let carId: Int
    
    init(_ carId: Int) {
        self.carId = carId
    }
    
    var body: some View {
        VStack{
            switch viewModel.carDetailsUiState {
            case .idle:
                EmptyView()
            case .loading:
                EmptyView()
            case .success(let car):
                carDetailsCard(car)
                ownerDetails(car.owner)
                
                bookCard(car)
            case .failure(let error):
                EmptyView()
            }
            
        }
        .onAppear {
            viewModel.getCarDetails(carId)
        }
        .sheet(item: $showSheet) { car in
            PackagesSheet(for: car)
                .padding()
                .presentationDetents([.height(sheetHeight)])
                .presentationBackground(.ultraThinMaterial)
                .overlay {
                    GeometryReader { geometry in
                        Color.clear.preference(key: PackageSheetPreferenceKey.self, value: geometry.size.height)
                    }
                }
                .onPreferenceChange(PackageSheetPreferenceKey.self) { newHeight in
                    sheetHeight = newHeight
                }
        }
    }
    
    @ViewBuilder
    private func carDetailsCard(_ car: Car) -> some View {
        VStack(alignment: .leading, spacing: 16){
            VStack(alignment: .leading){
                HStack{
                    Text(car.make)
                        .font(.system(size: 18, weight: .regular))
                    Spacer()
                    
                    HStack{
                        Image(systemName: "star.fill")
                        Text(car.rating.toString)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                Text(car.model + " " + String(car.year))
                    .font(.system(size: 24, weight: .bold))
            }
            
            if let fuelLevel = car.fuelLevel {
                label(image: "fuelpump.fill", label: "Fuel level", value: "\(fuelLevel)Km")
            }
            
            label(image: "engine.combustion.fill", label: "engine performance", value: car.engine.type.rawValue + " - " + "\(car.engine.horsePower)hp")
            label(image: "gearshift.layout.sixspeed", label: "engine transmission", value: car.engine.transmission.rawValue)
            label(image: "location.fill", label: "farthest location", value: "100Km")
            
            if car.isFreeCancelation {
                HStack{
                    Spacer()
                    Text("Free cancellation")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 16))
                }
            }
        }
        .padding(.top, 68)
        .padding()
        .background(Color.white.opacity(0.4))
        .clipShape(.rect(cornerRadius: 16))
        .overlay(alignment: .top) {
            Image(car.imageUrl)
                .resizable()
                .padding(.horizontal, 32)
                .scaledToFit()
                .offset(y: -140)
        }
    }
    
    @ViewBuilder
    private func ownerDetails(_ owner: Owner) -> some View {
        HStack{
            VStack(alignment: .leading, spacing: 16){
                Text(owner.firstname + " " + owner.lastname)
                    .font(.system(size: 20, weight: .semibold))
                HStack{
                    Image(systemName: "star.fill")
                    
                    Text(owner.rating.toString)
                        .font(.system(size: 18, weight: .regular))
                }
            }
            Spacer()
            
            if let profileImageUrl = owner.profileImageUrl {
                Image(profileImageUrl)
                    .resizable()
                    .frame(width: 38, height: 38)
                    .clipShape(.circle)
            }
        }
        .padding()
        .background(.ultraThickMaterial)
        .clipShape(.rect(cornerRadius: 16))
    }
    
    @ViewBuilder
    private func bookCard(_ car: Car) -> some View {
        if let firstPackage = car.packages.first {
            HStack{
                VStack(alignment: .leading){
                    Text(String(firstPackage.pricing.initialPrice) + "DA")
                        .font(.system(size: 18, weight: .bold))
                    Text("Price estimation")
                        .font(.system(size: 16, weight: .regular))
                        .opacity(0.8)
                }
                Spacer()
                
                Button {
                    self.showSheet = car
                } label: {
                    Text("Book now")
                        .font(.system(size: 18, weight: .bold))
                        .padding()
                        .padding(.horizontal)
                        .background(.ultraThinMaterial)
                        .clipShape(.capsule)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .background(.ultraThickMaterial)
            .clipShape(.rect(cornerRadius: 16))
        }
    }
    
    @ViewBuilder
    private func label(image: String, label: String, value: String) -> some View {
        HStack(spacing: 16){
            Image(systemName: image)
                .padding()
                .background(.white.opacity(0.8))
                .clipShape(.circle)
                .frame(width: 42, height: 42)
            VStack(alignment: .leading){
                Text(value)
                    .font(.system(size: 20, weight: .semibold))
                
                Text(label)
                    .font(.system(size: 12, weight: .regular))
                    .opacity(0.5)
            }
        }
    }
}

#Preview {
    CarDetailsSheet(5678912035)
}

struct PackageSheetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
