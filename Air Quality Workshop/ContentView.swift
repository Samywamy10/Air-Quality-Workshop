//
//  ContentView.swift
//  Air Quality Workshop
//
//  Created by Sam Wright on 29/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var selectedSiteId: String?
    
    var body: some View {
        if(selectedSiteId == nil) {
            VStack {
                Text("Select your nearest monitoring site").font(.headline)
                List {
                    Button(action: {
                        selectedSiteId = "Abbotsford"
                    }) {
                        Text("Abbotsford")
                    }
                    
                    Button(action: {
                        selectedSiteId = "Docklands"
                    }) {
                        Text("Docklands")
                    }
                    
                    Button(action: {
                        selectedSiteId = "Elsternwick"
                    }) {
                        Text("Elsternwick")
                    }
                }
            }.padding()
        } else {
            SelectedSiteView(selectedSiteId: $selectedSiteId)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
