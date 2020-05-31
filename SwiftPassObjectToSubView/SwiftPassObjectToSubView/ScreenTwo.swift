//
//  ScreenTwo.swift
//  SwiftPassObjectToSubView
//
//  Created by user on 31.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI
import Combine

struct ScreenTwo : View{
    @ObservedObject var sport : Sport

    var body: some View{
        NavigationLink(destination: DetailsView(sport: sport)){
            VStack {
                Text("Is favorite: ")
            Text(sport.isFavorite.description)        }
        }
    }
}
