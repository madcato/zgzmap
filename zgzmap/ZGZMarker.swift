import MapKit
import SwiftUI

class ZGZMarker: Identifiable {
    var id: UUID
    var location: CLLocationCoordinate2D
    var name: String
    init(id: UUID = UUID(), lat: Double, lng: Double, name: String) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        self.name = name
    }
}

class BiziMarker: ZGZMarker {
    var url: String = ""
}

class BusMarker: ZGZMarker {
    var url: String = ""
    
    init(lat: Double, lng: Double, name: String, url: String) {
        super.init(lat: lat, lng: lng, name: name)
        self.url = url
    }
}

#if DEBUG
let zgz = MKCoordinateRegion(center: CLLocationCoordinate2DMake(41.61705, -0.88734), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
let testData = [
    ZGZMarker(lat: 41.65606, lng: -0.87734, name: "Zaragoza1"),
    ZGZMarker(lat: 41.75806, lng: -0.86534, name: "Zaragoza2"),
    ZGZMarker(lat: 41.55606, lng: -0.89734, name: "Zaragoza3"),
    ZGZMarker(lat: 41.62606, lng: -0.77734, name: "Zaragoza4"),
    ZGZMarker(lat: 41.68606, lng: -0.90734, name: "Zaragoza5")
]
#endif
