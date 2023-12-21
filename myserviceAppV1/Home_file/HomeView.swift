//
//  HomeView.swift
//  myserviceAppV1
//
//  Created by Hiarina Rakotoarivelo on 12/12/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct HomeView: View {
    let locationManager = CLLocationManager()
    @State var region = MKCoordinateRegion(
            center: .init(latitude: 37.334_900,longitude: -122.009_020),
            span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    var body: some View {
        Map (coordinateRegion: $region, interactionModes: [.rotate, .pan, .zoom], showsUserLocation: true)
        .mapControls {
            MapUserLocationButton()
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
            
        }
        .mapStyle(.standard(elevation: .realistic, pointsOfInterest: .including([.airport])))
    }
}

#Preview {
    HomeView()
}





