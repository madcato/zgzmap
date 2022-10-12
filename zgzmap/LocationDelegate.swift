import CoreLocation
import MapKit
import SwiftUI

class LocationDelegate: NSObject,ObservableObject,CLLocationManagerDelegate{
    @Published var location: CLLocation?
    let manager = CLLocationManager()
    var region: Binding<MKCoordinateRegion>? {
        guard let location = manager.location else {
            return MKCoordinateRegion.zgzRegion().getBinding()
        }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        return region.getBinding()
    }
    
    override init() {
        super.init()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = kCLDistanceFilterNone
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        manager.delegate = self
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse{
            print("Authorized")
            manager.startUpdatingLocation()
        } else {
            print("not authorized")
            manager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.location = location
        }
    }
}

extension MKCoordinateRegion {
    
    static func zgzRegion() -> MKCoordinateRegion {
        zgz
    }
    
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
