// This example is from
// Passing An ObservedObject To Nested Child Views SwiftUI (SwiftUI Data Flow)

/* https://stackoverflow.com/questions/57551220/passing-an-observedobject-to-nested-child-views-swiftui-swiftui-data-flow
 */



//
//  DetailsView.swift
//  SwiftPassObjectToSubView
//
//  Created by user on 31.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI
import Combine


struct DetailsView: View {
    @ObservedObject var sport : Sport

    var body: some View {
        Button(action: {
            self.sport.isFavorite.toggle()
            self.sport.name = "Ricky"
        }) {
            Text(sport.isFavorite.description)
            Text(sport.name)
        }
    }
}


