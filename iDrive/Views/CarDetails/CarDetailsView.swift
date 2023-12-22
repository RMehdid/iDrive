//
//  CarDetailsView.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import SwiftUI

struct CarDetailsView: View {
    let car: Car
    
    init(_ car: Car) {
        self.car = car
    }
    
    var body: some View {
        carDetailsCard()
        ownerDetails(.owner)
        bookCard()
    }
    
    @ViewBuilder
    private func carDetailsCard() -> some View {
        VStack(alignment: .leading, spacing: 16){
            VStack(alignment: .leading){
                HStack{
                    Text(car.make + " - " + car.model)
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                    
                    HStack{
                        Image(systemName: "star.fill")
                        Text(car.rating.toString)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                Text(String(car.year))
                    .font(.system(size: 16, weight: .regular))
            }
            
            label(image: "fuelpump.fill", label: "Fuel level", value: "\(car.fuelLevel)Km")
            label(image: "engine.combustion.fill", label: "engine performance", value: car.engine.toString)
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
        .background(Color.blue)
        .clipShape(.rect(cornerRadius: 16))
        .foregroundStyle(.white)
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
            .foregroundStyle(.white)
            Spacer()
            
            Image(owner.profileImageUrl)
                .resizable()
                .frame(width: 38, height: 38)
                .clipShape(.circle)
        }
        .padding()
        .background(Color.blue)
        .clipShape(.rect(cornerRadius: 16))
    }
    
    @ViewBuilder
    private func bookCard() -> some View {
        HStack{
            VStack(alignment: .leading){
                Text("200$")
                    .font(.system(size: 18, weight: .bold))
                Text("Reserve your car")
                    .font(.system(size: 16, weight: .regular))
                    .opacity(0.8)
            }
            .foregroundStyle(.white)
            Spacer()
            
            Button {
                //
            } label: {
                Text("Book now")
                    .font(.system(size: 18, weight: .bold))
                    .padding()
                    .padding(.horizontal)
                    .background(.ultraThickMaterial)
                    .clipShape(.capsule)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(Color.blue)
        .clipShape(.rect(cornerRadius: 16))
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
