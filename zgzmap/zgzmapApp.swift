import MapKit
import SwiftUI

class Model: ObservableObject {
    @Published var markers: [ZGZMarker] = []
    
    init(markers: [ZGZMarker]) {
        self.markers = markers
    }
    
    init() {
    }
    
    func loadData() {
        let busstops = loadBusStops()
        markers.append(contentsOf: busstops)
    }
    
    private func loadBusStops() -> [BusMarker] {
        guard let path = Bundle.main.path(forResource: "busstops", ofType: "plist") else { return [] }
        let url = URL(fileURLWithPath: path)
        guard let plist = try? NSMutableDictionary(contentsOf: url, error: ()) else { return [] }
        
        guard let array = plist.object(forKey: "busstops") as? [Dictionary<String, Any>] else { return [] }
        
        let busstops = array.map { dict in
            return BusMarker(lat: Double(dict["latitude"] as? String ?? "0.0") ?? 0.0,
                             lng: Double(dict["longitude"] as? String ?? "0.0") ?? 0.0,
                             name: dict["name"] as? String ?? "",
                             url: dict["url"] as? String ?? "")
        }
        return busstops
    }
}

@main
struct zgzmapApp: App {
  
    var body: some Scene {
        WindowGroup {
            ContentView(model: Model())
        }
    }
}
