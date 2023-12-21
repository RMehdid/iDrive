//
//  CarCard.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import SwiftUI
import CoreLocation

struct CarCard: View {
    let car: Car
    
    init(_ car: Car) {
        self.car = car
    }
    
    var body: some View {
        HStack{
            Image("ic_car")
                .resizable()
                .renderingMode(.template)
                .frame(width: 18, height: 18)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.circle)
            VStack(alignment: .leading){
                Text(car.name + " - " + car.color)
                    .font(.system(size: 16, weight: .semibold))
                Text(String(car.year))
                    .font(.system(size: 16, weight: .regular))
            }
            
            Spacer()
            
            HStack{
                Image(systemName: "star.fill")
                    .frame(width: 18, height: 18)
                Text(car.rating.toString)
                    .font(.system(size: 16, weight: .medium))
            }
        }
        .padding()
    }
}

#Preview {
    CarCard(Car.sampleCars.first!)
        .background(.ultraThinMaterial)
}
