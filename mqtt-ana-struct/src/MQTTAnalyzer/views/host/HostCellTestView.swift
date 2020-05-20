//
//  HostCellTestView.swift
//  MQTTAnalyzer
//
//  Created by user on 20.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

enum HostCellViewSheetType {
    
    case edit
    case login
}





struct HostCellTestView: View {
    @EnvironmentObject var model: RootModel
    
    var person: Person
    
    var disconn: Bool = true
    
    @State var sheetPresented = false
    @State var sheetType = HostCellViewSheetType.edit
    
    var body: some View {
        NavigationLink (destination: TopicsTestView(stringToDisplay: person.name)) {
            HStack {
                VStack  {
                    Text(person.name)
                    Spacer()
                    Text(person.url)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "circle.fill")
                    .foregroundColor(.green)
            }
            
            .contextMenu {
            MenuButton(title: "Edit", systemImage: "pencil.circle", action: editHost)
            //if host.state != .disconnected {
            if (disconn == true) {
                MenuButton(title: "Disconnect", systemImage: "stop.circle", action: disconnect)
            }
            else {
                MenuButton(title: "Connect", systemImage: "play.circle", action: connect)
            }
            
                }
            
        }
               
            
    
}
    
    func disconnect() {
        
        var disconnectMessage = "Disconnecting"
    }
    
    func editHost() {
        
        var editMessage = "Editing"
    }
    
    func connect() {
        
        var connectMessage = "Editing"
    }
}

