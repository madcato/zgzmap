import MapKit
import SwiftUI

struct ContentView: View {
    @State var mapRegion:MKCoordinateRegion
    let markers: [ZGZMarker]
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: markers) { marker in
                MapMarker(coordinate: marker.location)
            }
            .navigationTitle("zgzmap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mapRegion: zgz, markers: testData)
    }
}
