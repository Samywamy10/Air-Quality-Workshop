//
//  ContentView.swift
//  Air Quality Workshop
//
//  Created by Sam Wright on 29/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Select your nearest monitoring site").font(.headline)
            List {
                Button(action: {}) {
                    Text("Abbotsford")
                }
                
                Button(action: {}) {
                    Text("Docklands")
                }
                
                Button(action: {}) {
                    Text("Elsternwick")
                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
