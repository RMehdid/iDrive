//
//  UiState.swift
//  iDrive
//
//  Created by Samy Mehdid on 21/12/2023.
//

import Foundation

enum UiState<Model> {
    case idle
    case loading
    case success(Model)
    case failure(DVError)
}
