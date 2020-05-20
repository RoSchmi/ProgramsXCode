//
//  HostsView.swift
//  MQTTAnalyzer
//
//  Created by user on 19.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct Person : Hashable {
    var id: String
    var name: String
    var url: String
}

struct HostsView: View {
    @EnvironmentObject var model: RootModel
        
    @ObservedObject var hostModel = HostsModel()
    
    var disconnected: Bool = true
    
    var body: some View {
                
        NavigationView {
            HStack {
            VStack(alignment: .leading) {
                List {
                    
                     // selectedPerson is a name which can be chosen by you
                     // 'person' is a variable in HostCellTestView
                    ForEach(hostModel.persons, id: \.self) {selectedPerson in
                        HostCellTestView(person: selectedPerson)}
                    .onDelete(perform: delete)
                    }
                
                    }
            }
            /*
            .contextMenu {
            MenuButton(title: "Edit", systemImage: "pencil.circle", action: editHost)
            //if host.state != .disconnected {
            if .disconnected {
                MenuButton(title: "Disconnect", systemImage: "stop.circle", action: disconnect)
            }
            else {
                MenuButton(title: "Connect", systemImage: "play.circle", action: connect)
            }
            
                }
                */
                
            
        }
        
    }
    
    func disconnect() {}
    
    func editHost() {}
    
    
    func delete(at offsets: IndexSet) {
        hostModel.persons.remove(atOffsets: offsets)
    }
}



