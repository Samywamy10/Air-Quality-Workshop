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
}

struct Site {
    var siteID: String
    var siteName: String
}

struct AirQualityParameter {
    var name: String
    var value: Double
    var unit: String
}
