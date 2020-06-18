//
//  RootModel.swift
//  SwiftRealmTest
//
//  Created by user on 16.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//


import SwiftUI
import Combine


protocol InitHost: class {
    func initHost(host: Host)
}


/*
protocol ReconnectDelegate: class {
    func reconnect(host: Host)
}
*/

/*
protocol DisconnectDelegate: class {
    func disconnect(host: Host)
}
*/

class RootModel: ObservableObject {
   // static let controller = MQTTSessionController()
    
   // let sessionController = controller

   //let hostsModel = HostsModel(initMethod: controller)
    
    let commandsModel = CommandsModel()
   // var messageModelByHost: [Host: MessageModel] = [:]
    
    // RoSchmi
    //let persistence: HostsModelPersistence
    let persistence: CommandModelPersistence
    
    init() {
        self.persistence = CommandModelPersistence(model: hostsModel)
        self.persistence.load()
        
        /*
        for host in hostsModel.hosts {
            messageModelByHost[host] = MessageModel()
        }
        */
    }
 
    /*
    func getMessageModel(_ host: Host) -> MessageModel {
        var model = messageModelByHost[host]
        
        if model == nil {
            model = MessageModel()
            messageModelByHost[host] = model
        }
        
        return model!
    }
    */
    
    
    /*
    func connect(to: Host) {
        to.state = .connecting
        sessionController.model = messageModelByHost[to]
        sessionController.connect(host: to)
    }
 */
    
    /*
    func disconnect(from: Host) {
        sessionController.disconnect(host: from)
    }
 */
    
    /*
    func publish(message: Message, on: Host) {
        sessionController.publish(message: message, on: on)
    }
 */
    
    /*
    func reconnect() {
        for host in hostsModel.hosts {
            if host.wasConnected && host.state == .disconnected {
                connect(to: host)
            }
        }
    }
    */
}


