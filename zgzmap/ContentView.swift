import MapKit
import SwiftUI

struct ContentView: View {
    @State var tracking : MapUserTrackingMode = .follow
    @StateObject var managerDelegate = LocationDelegate()
    let model: Model
    
    var body: some View {
        NavigationView {
            if let region = managerDelegate.region {
                Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking, annotationItems: model.markers) { marker in
                    markerView(for: marker)
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
        }.onAppear { model.loadData() }
    }
    
    private func markerView(for marker: ZGZMarker) -> MapMarker {
        MapMarker(coordinate: marker.location)
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
        ContentView(model: Model(markers: testData))
    }
}
