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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CarDetailsView(Car.sampleCars.first!)
}
