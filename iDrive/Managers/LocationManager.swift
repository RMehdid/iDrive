//
//  LocationManager.swift
//  iDrive
//
//  Created by Samy Mehdid on 22/12/2023.
//

import MapKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {

    static let shared = LocationManager()

    @Published private(set) var location: CLLocation?
    @Published private(set) var status: CLAuthorizationStatus?

    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }

    func requestLocation() {
        manager.requestAlwaysAuthorization()
    }

    public func setBackgroundModeOnOff(_ value: Bool) {
        manager.allowsBackgroundLocationUpdates = value
        manager.showsBackgroundLocationIndicator = value
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
        switch status {
        case .notDetermined:
            print("not determined")
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways, .authorizedWhenInUse:
            print("location should be shown")
        default:
            break
        }
    }
}
