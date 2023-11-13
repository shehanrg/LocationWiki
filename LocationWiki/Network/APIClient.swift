//
//  APIClient.swift
//  LocationWiki
//
//  Created by Shehan Gunarathne on 06/11/2023.
//

import Foundation

class APIClient {
    let baseURL: String
    
    init(baseURL: String? = nil) {
        self.baseURL = baseURL ?? "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json"
    }
    
    func fetch<T: Codable>() async throws -> T {
        guard let url = URL(string: baseURL) else {
            fatalError("Could not resolve the url")
        }
        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.requestFailed(description: "Invalid response")
        }
        guard httpResponse.statusCode == 200 else {
            throw ApiError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }
        
        if let dataString = String(data: data, encoding: .utf8) {
            do {
                let decoder = JSONDecoder()
                let respon = try decoder.decode(T.self, from: Data(dataString.utf8))
                return respon
            } catch {
                throw ApiError.jsonConversionFailure(description: error.localizedDescription)
            }
        } else {
            throw ApiError.jsonConversionFailure(description: nil)
        }
    }
}

enum ApiError: Error {
    case requestFailed(description: String)
    case invalidData
    case responseUnsuccessful(description: String)
    case jsonConversionFailure(description: String?)
    case jsonParsingFailure
    case failedSerialization
    case noInternet
}

//https://medium.com/@ihsanakbay/simple-generic-network-layer-using-async-await-in-swift-swiftui-ff7916b89ebf
