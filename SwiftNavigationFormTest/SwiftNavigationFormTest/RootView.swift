//
//  RootView.swift
//  MQTTAnalyzer
//
//  Created by Philipp Arndt on 2019-07-02.
//  Copyright © 2019 Philipp Arndt. All rights reserved.
//

import SwiftUI
import Highlightr

struct RootView: View {
    @EnvironmentObject var model: RootModel

    var body: some View {
        VStack {
            
            HostsView(hostsModel: model.hostsModel)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}




