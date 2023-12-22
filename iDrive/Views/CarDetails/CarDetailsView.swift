//
//  CarDetailsView.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import SwiftUI

struct CarDetailsView: View {
    let car: Car
    
    @State private var bookingUiState: BookingUiState = .idle
    
    @State private var pickupDate = Date()
    @State private var dropOffDate = Date()
    @State private var mileage = ""
    
    init(_ car: Car) {
        self.car = car
    }
    
    var body: some View {
        switch bookingUiState {
        case .idle:
            carDetailsCard()
            ownerDetails(.owner)
            bookCard(price: car.priceEstimationPerHour)
        case .choosePackage(let car):
            choosePackage(car)
        case .showPrice(let package):
            showPriceView(package)
        case .booked:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func carDetailsCard() -> some View {
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
            
            label(image: "fuelpump.fill", label: "Fuel level", value: "\(car.fuelLevel)Km")
            label(image: "engine.combustion.fill", label: "engine performance", value: car.engine.type.rawValue + " - " + "\(car.engine.horsePower)hp")
            label(image: "gearshift.layout.sixspeed", label: "engine transmission", value: car.engine.transmission.rawValue)
            label(image: "location.fill", label: "farthest location", value: "100Km")
            
            if car.isFreeCancellation {
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
        .background(.ultraThickMaterial)
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
                Text(owner.firstname + owner.lastname)
                    .font(.system(size: 20, weight: .semibold))
                HStack{
                    Image(systemName: "star.fill")
                    
                    Text(owner.rating.toString)
                        .font(.system(size: 18, weight: .regular))
                }
            }
            Spacer()
            
            Image(owner.profileImageUrl)
                .resizable()
                .frame(width: 38, height: 38)
                .clipShape(.circle)
        }
        .padding()
        .background(.ultraThickMaterial)
        .clipShape(.rect(cornerRadius: 16))
    }
    
    @ViewBuilder
    private func bookCard(price priceEstimation: Int) -> some View {
        HStack{
            VStack(alignment: .leading){
                Text(String(priceEstimation) + "DA")
                    .font(.system(size: 18, weight: .bold))
                Text("Price estimation")
                    .font(.system(size: 16, weight: .regular))
                    .opacity(0.8)
            }
            Spacer()
            
            Button {
                self.bookingUiState = .choosePackage(car: car)
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
    
    @ViewBuilder
    private func choosePackage(_ car: Car) -> some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text(car.make)
                    .font(.system(size: 18, weight: .regular))
                Text(car.model + " " + String(car.year))
                    .font(.system(size: 24, weight: .bold))
            }
            ForEach(Package.allCases) { packageBuilder($0) }
            
            HStack{
                Spacer()
                Button("Cancel") {
                    self.bookingUiState = .idle
                }
                .buttonStyle(PlainButtonStyle())
                .padding(8)
                .padding(.horizontal)
                .background(.ultraThinMaterial)
                .background(Color.red)
                .clipShape(.capsule)
            }
        }
        .padding()
        .background(.ultraThickMaterial)
        .clipShape(.rect(cornerRadius: 16))
    }
    
    @ViewBuilder
    private func showPriceView(_ package: Package) -> some View {
        VStack{
            
        }
    }
    
    @ViewBuilder
    private func packageBuilder(_ package: Package) -> some View {
        Button {
            self.bookingUiState = .showPrice(selectedPackage: package)
        } label: {
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: package.imageName)
                        .frame(width: 24, height: 24)
                    Text(package.rawValue)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                }
                
                Text(package.description)
                    .font(.system(size: 16, weight: .regular))
                    .opacity(0.8)
            }
            .padding()
            .background(Material.bar)
            .clipShape(.rect(cornerRadius: 8))
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    @ViewBuilder
    private func label(image: String, label: String, value: String) -> some View {
        HStack(spacing: 16){
            Image(systemName: image)
                .padding()
                .background(.ultraThinMaterial)
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
    CarDetailsView(Car.sampleCars.first!)
}
