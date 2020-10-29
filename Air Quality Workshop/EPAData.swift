//
//  EPAData.swift
//  Air Quality Workshop
//
//  Created by Sam Wright on 29/10/20.
//

import Foundation

class EPAData: ObservableObject {
    @Published var sites: [Site] = [Site(siteID: "1", siteName: "Abbotsford"), Site(siteID: "2", siteName: "Docklands"), Site(siteID: "3", siteName: "Elsternwick")]
    @Published var airQualityParameters: [AirQualityParameter] = [AirQualityParameter(name: "CO2", value: 1.1, unit: "ppm"), AirQualityParameter(name: "Visibility", value: 100, unit: "m")]
    
    func loadSitesList() {
        guard let url = URL(string: "https://australia-southeast1-air-quality-api-victoria.cloudfunctions.net/sites") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        let _ = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() {
                element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [Site].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .assign(to: &$sites)
    }
        
    func loadSiteData(siteId: String) {
        guard let url = URL(string: "https://australia-southeast1-air-quality-api-victoria.cloudfunctions.net/siteAirQuality?siteId=" + siteId) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        let _ = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() {
                element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [AirQualityParameter].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .assign(to: &$airQualityParameters)
    }

}

struct Site: Codable {
    var siteID: String
    var siteName: String
}

struct AirQualityParameter: Codable {
    var name: String
    var value: Double
    var unit: String
}
