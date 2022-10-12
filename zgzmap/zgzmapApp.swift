
import MapKit
import SwiftUI

@main
struct zgzmapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(mapRegion: zgz, markers: testData)
        }
    }
}
