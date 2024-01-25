//
//  PackagesSheet.swift
//  iDrive
//
//  Created by Samy Mehdid on 7/1/2024.
//

import SwiftUI

struct PackagesSheet: View {

    let car: Car

    @State private var showSheet: Package?
    @State private var sheetHeight: CGFloat = .zero

    init(for car: Car) {
        self.car = car
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(car.make)
                .font(.system(size: 18, weight: .regular))
            Text(car.model + " " + String(car.year))
                .font(.system(size: 24, weight: .bold))

            ForEach(car.packages) { packageBuilder($0) }
        }
        .presentationDetents([showSheet == nil ? .large : .height(0)])
        .sheet(item: $showSheet) { package in
            DatePickerSheet(using: package) { pickup, dropOff in
                print("pickup: " + pickup.description)
                print("drop off: " + dropOff.description)
            }
            .padding()
            .overlay {
                GeometryReader { geometry in
                    Color.clear.preference(key: DatePickerSheetPreferenceKey.self, value: geometry.size.height)
                }
            }
            .onPreferenceChange(DatePickerSheetPreferenceKey.self) { newHeight in
                sheetHeight = newHeight
            }
            .presentationDetents([.height(sheetHeight)])
            .presentationBackground(.ultraThinMaterial)
        }
    }

    @ViewBuilder
    private func packageBuilder(_ package: Package) -> some View {
        Button {
            self.showSheet = package
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: package.imageName)
                        .frame(width: 24, height: 24)
                    Text(package.name)
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                    Text(String(package.pricing.initialPrice) + "DA")
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
}

struct DatePickerSheetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
