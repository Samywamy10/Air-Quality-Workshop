//
//  SelectedSiteView.swift
//  Air Quality Workshop
//
//  Created by Sam Wright on 29/10/20.
//

import SwiftUI

struct SelectedSiteView: View {
    @Binding var selectedSiteId: String?
    @ObservedObject var epaData: EPAData
    
    var body: some View {
        VStack {
            Button("Back", action: {
                    withAnimation {
                        selectedSiteId = nil
                        
                    } 
            })
            Text(epaData.sites.first { $0.siteID == selectedSiteId}?.siteName ?? "Unknown").font(.headline)
            ForEach(epaData.airQualityParameters, id: \.name) { airQualityParameter in
                HStack {
                    Text(airQualityParameter.name)
                    Spacer()
                    Text("\(airQualityParameter.value)\(airQualityParameter.unit)")
                }.padding()
            }
        }.padding()
    }
}

struct SelectedSiteView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedSiteView(selectedSiteId: .constant("Elsternwick"), epaData: EPAData())
    }
}
