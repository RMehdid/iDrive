//
//  DatePickerSheet.swift
//  iDrive
//
//  Created by Samy Mehdid on 7/1/2024.
//

import SwiftUI

struct DatePickerSheet: View {

    let package: Package

    @State private var pickupDate = Date()

    private var dropOffDate: Date {
        return pickupDate.addingTimeInterval(TimeInterval(package.initialPeriod))
    }

    let selected: (Date, Date) -> Void

    init(using package: Package, selected: @escaping (Date, Date) -> Void) {
        self.package = package
        self.selected = selected
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 24) {
                DatePicker("From", selection: $pickupDate)

                VStack(alignment: .leading, spacing: 12) {
                    Text("You will have to check out by:")
                        .font(.system(size: 18, weight: .medium))

                    Text(
                        dropOffDate
                            .getFormattedDate(format: "EEEE dd MMM yyyy") +
                        " at " +
                        dropOffDate
                            .getFormattedDate(format: "HH:MM")
                    )
                }
            }
            .padding()
            .background(.ultraThickMaterial)
            .clipShape(.rect(cornerRadius: 12))

            Button("Confirm") {
                self.selected(pickupDate, dropOffDate)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(8)
            .padding(.horizontal)
            .background(.ultraThinMaterial)
            .clipShape(.capsule)
        }
    }
}

// #Preview {
//    DatePickerSheet()
// }
