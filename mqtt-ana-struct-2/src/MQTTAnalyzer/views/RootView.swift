//
//  RootView.swift
//  MQTTAnalyzer
//
//  Created by user on 19.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

// This Example shows Delete and Navigation Link and treies to use the basic structure of mqtt-analyzer

import SwiftUI
import Highlightr

struct RootView: View {
    @EnvironmentObject var model: RootModel
    
    @ObservedObject var hostModel = HostsModel()
        
    var body: some View {
        VStack {
            HostsView(hostModel: hostModel)
        }
    }
}


