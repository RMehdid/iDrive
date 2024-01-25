//
//  ErrorView.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/1/2024.
//

import SwiftUI

struct ErrorView: View {

    let error: DVError

    init(_ error: DVError) {
        self.error = error
    }

    var body: some View {
        VStack {
            switch error {
            case .timout:
                Image(systemName: "clock.arrow.2.circlepath")
                Text("Request timed out")
            case .badUrl, .badResponse, .badRequest:
                Image(systemName: "ellipsis.curlybraces")
                Text("Internal error")
            case .unAuthorized:
                Image(systemName: "person.crop.circle.badge.exclamationmark.fill")
                Text("You are not authenticated")
            case .forbidden:
                Image(systemName: "wrongwaysign.fill")
                Text("You don't have accesss")
            case .unknown:
                Image(systemName: "exclamationmark.triangle.fill")
                Text("something went wrong")
            }
        }
    }
}

#Preview {
    ErrorView(.unAuthorized)
}
