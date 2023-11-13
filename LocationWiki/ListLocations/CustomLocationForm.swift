//
//  CustomLocationForm.swift
//  LocationWiki
//
//  Created by Shehan Gunarathne on 13/11/2023.
//

import SwiftUI

struct CustomLocationForm: View {
    @ObservedObject var viewModel: ListLocationViewModel
    
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State private var errorMessage: String = ""
    
    var inputs: [String] {[latitude, longitude]}
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Location")) {
                    TextField("Latitude", text: $latitude)
                        .keyboardType(.numbersAndPunctuation)
                    TextField("Longitude", text: $longitude)
                        .keyboardType(.numbersAndPunctuation)
                    Button("Submit") {
                        submitButtonTapped()
                    }
                    .foregroundStyle(.black)
                }
                if !errorMessage.isEmpty {
                    Section {
                        Text(errorMessage)
                            .font(.callout)
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Enter location")
            .toolbarTitleDisplayMode(.inline)
            .onChange(of: inputs) { _, _ in
                errorMessage = ""
            }
        }
    }
    
    func submitButtonTapped() {
        if let latitudeDouble = Decimal(string: latitude),
           let longitudeDouble = Decimal(string: longitude) {
            let location = Location(name: nil, lat: latitudeDouble, long: longitudeDouble)
            viewModel.openUrlForLocation(location)
            viewModel.displayFormView = false
        } else {
            errorMessage = "Invalid input. Please enter valid latitude and longitude."
        }
    }
}

#Preview {
    CustomLocationForm(viewModel: ListLocationViewModel())
}
