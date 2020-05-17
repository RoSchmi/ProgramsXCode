//
//  MapView.swift
//  Landmarks Tutorial
//
//  Created by user on 08.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView:UIViewRepresentable{
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    func updateUIView(_ view: MKMapView, context: Context) {
        let coor = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coor, span: span)
        view.setRegion(region, animated: true)
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
