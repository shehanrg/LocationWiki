//
//  ListLocationViewModel.swift
//  LocationWiki
//
//  Created by Shehan Gunarathne on 06/11/2023.
//

import SwiftUI

@MainActor
class ListLocationsViewModel: ObservableObject {
    @Published var locations = [Location]()
    @Published var displayFormView = false
    
    init(locations: [Location] = [Location]()) {
        self.locations = locations
    }
    
    func fetchLocations() async {
        do {
            let response: LocationsResponse = try await APIClient().fetch()
            locations = response.locations
        } catch {
            locations = []
        }
    }
    
    func openUrlForLocation(_ location: Location) {
        guard let url = URL(string: "wikipedia://location/?lat=\(location.lat)&long=\(location.long)") else {
            assertionFailure("Could not prepare the URL to deeplink")
            return
        }
        UIApplication.shared.open(url)
    }
    
    func dismissFormView() {
        
    }
}
