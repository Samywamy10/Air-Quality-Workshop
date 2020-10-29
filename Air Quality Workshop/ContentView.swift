//
//  ContentView.swift
//  Air Quality Workshop
//
//  Created by Sam Wright on 29/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var selectedSiteId: String?
    @StateObject var epaData = EPAData()
    
    var body: some View {
        if(selectedSiteId == nil) {
            VStack {
                Text("Select your nearest monitoring site").font(.headline)
                List(epaData.sites, id: \.siteID) { site in
                    Button(action: {
                        selectedSiteId = site.siteID
                    }) {
                        Text(site.siteName)
                    }
                }
            }.padding()
        } else {
            SelectedSiteView(selectedSiteId: $selectedSiteId, epaData: epaData)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
