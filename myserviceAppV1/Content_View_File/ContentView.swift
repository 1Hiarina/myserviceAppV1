//
//  ContentView.swift
//  myserviceAppV1
//
//  Created by Hiarina Rakotoarivelo on 12/12/2023.
//

import SwiftUI
import MapKit


struct ContentView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tag(1)
            MyServicesView()
                .tag(2)
            ChatView()
                .tag(3)
            ProfileView()
                .tag(4)
        }
        .overlay(alignment: .bottom) {
            Custom_Tab_View(tabSelection: $tabSelection)
            
        }
    }
}

#Preview {
    ContentView()
}







