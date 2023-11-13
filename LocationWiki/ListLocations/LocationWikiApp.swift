//
//  LocationWikiApp.swift
//  LocationWiki
//
//  Created by Shehan Gunarathne on 05/11/2023.
//

import SwiftUI

@main
struct LocationWikiApp: App {
    var body: some Scene {
        WindowGroup {
            let listViewModel = ListLocationsViewModel()
            ListLocationsView(viewModel: listViewModel)
        }
    }
}
