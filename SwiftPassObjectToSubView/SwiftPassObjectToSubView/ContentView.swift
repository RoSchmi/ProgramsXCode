// This example is from 
/* https://stackoverflow.com/questions/57551220/passing-an-observedobject-to-nested-child-views-swiftui-swiftui-data-flow
*/


//
//  ContentView.swift
//  SwiftPassObjectToSubView
//
//  Created by user on 31.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI
import Combine

class Sport: ObservableObject, Hashable, Identifiable {

    static func == (lhs: Sport, rhs: Sport) -> Bool {
        lhs.name == rhs.name && lhs.isFavorite == rhs.isFavorite && lhs.school == rhs.school
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(isFavorite)
        hasher.combine(school)
    }

    @Published var name : String
    @Published var isFavorite = false
    @Published var school : String

    init(name: String, isFavorite: Bool, school: String) {
        self.name = name
        self.isFavorite = isFavorite
        self.school = school
    }
}

final class SportData: ObservableObject  {
    @Published var store =
        [
            Sport(name: "soccer", isFavorite: false, school: "WPI"),
            Sport(name: "tennis", isFavorite: false, school: "WPI"),
            Sport(name: "swimming", isFavorite: true, school: "WPI"),
            Sport(name: "running", isFavorite: true, school: "RIT"),
    ]
}
struct ContentView: View {
    @ObservedObject var sports = SportData()

    var body: some View {
        NavigationView{
            List{
                ForEach(sports.store){ sport in
                    NavigationLink(destination: ScreenTwo(sport: sport)) {
                        HStack {
                            Text("\(sport.name)")
                            Spacer()
                            Text(sport.isFavorite.description)
                        }
                    }
                    .onReceive(sport.$isFavorite) { _ in self.sports.objectWillChange.send() }
                }
            }
        }.navigationBarTitle("Settings")
    }
}
