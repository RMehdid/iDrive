//
//  UserDefaults.swift
//  iDrive
//
//  Created by Samy Mehdid on 27/1/2024.
//

import Foundation

extension UserDefaults {
    @objc dynamic var accessToken: String? {
        get { string(forKey: "accessToken") }
        set { setValue(newValue, forKey: "accessToken") }
    }
}
