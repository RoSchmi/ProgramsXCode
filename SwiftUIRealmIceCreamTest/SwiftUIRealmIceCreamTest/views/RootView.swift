//
//  RootView.swift
//  SwiftUIRealmIceCreamTest
//
//  Created by user on 16.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI
import Highlightr

struct RootView: View {
    
    @EnvironmentObject var model: RootModel
    
    var body: some View {
        CommandsView(commandsModel: model.commandsModel)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

/*
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
*/
