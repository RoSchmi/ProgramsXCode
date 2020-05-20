//
//  HostCellTestView.swift
//  MQTTAnalyzer
//
//  Created by user on 20.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI



struct HostCellTestView: View {
    
    var person: Person
    
    var body: some View {
        NavigationLink (destination: TopicsTestView(stringToDisplay: person.name)) {
            HStack {
                Text(person.name)
                Spacer()
                Text(person.url)
            }
        }
    }
}

