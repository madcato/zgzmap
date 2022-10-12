import MapKit
import SwiftUI

struct ContentView: View {
    @State var tracking : MapUserTrackingMode = .follow
    @StateObject var managerDelegate = LocationDelegate()
    let markers: [ZGZMarker]
    
    var body: some View {
        NavigationView {
            if let region = managerDelegate.region {
                Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking, annotationItems: markers) { marker in
                    MapMarker(coordinate: marker.location)
                }
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("zgzmap")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            onCenterInUserTapped()
                        } label: {
                            Image("arrow").tint(.red)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Actions
extension ContentView {
    private func onCenterInUserTapped() {
        managerDelegate.location = managerDelegate.location
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(markers: testData)
    }
}
