//
//  ListLocationsView.swift
//  LocationWiki
//
//  Created by Shehan Gunarathne on 05/11/2023.
//

import SwiftUI

struct ListLocationsView: View {
    @ObservedObject var viewModel: ListLocationViewModel
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: .zero) {
                List {
                    ForEach(viewModel.locations) { location in
                        locationRow(location)
                            .onTapGesture {
                                viewModel.openUrlForLocation(location)
                            }
                    }
                    customLocationButton()
                }
            }
            .navigationTitle("Location Wiki")
        }
        .task {
            await viewModel.fetchLocations()
        }
        .sheet(isPresented: $viewModel.displayFormView, content: {
            CustomLocationForm(viewModel: viewModel)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        })
    }
    
    
    @ViewBuilder
    func locationRow(_ location: Location) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            if let name = location.name {
                Text(name)
            }
            HStack {
                Text("Lat: \(location.lat.description)")
                Text("Long: \(location.long.description)")
            }
        }
    }

    @ViewBuilder
    func customLocationButton() -> some View {
        Button(action: {
            viewModel.displayFormView.toggle()
        }) {
            HStack {
                Image(systemName: "location.fill.viewfinder")
                Text("Enter Location")
            }
        }
        .padding([.horizontal], 8)
    }
}

#Preview {
    ListLocationsView(viewModel: ListLocationViewModel())
}
