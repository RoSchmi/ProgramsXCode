//
//  CommandModel.swift
//  SwiftRealmTest
//
//  Created by user on 16.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

class Command: Identifiable, ObservableObject {
    
    let ID: String
    var title: String
    var explanation: String
    var qos: Int
    var retain: Bool

    var deleted = false
    
    var clientID = ""
    
    init(id: String = NSUUID().uuidString, title: String, explanation: String, qos: Int, retain: Bool) {
        self.ID = id
        self.title = title
        self.explanation = explanation
        self.qos = qos
        self.retain = retain
    }
    
    
class CommandsModel: ObservableObject {
       // let initMethod: InitHost
        
        @Published var commands: [Command] {
            willSet {
                for command in newValue {}
                /*
                {
                    initMethod.initHost(host: host)
                }
                */
            }
        }
        
    /*
        var hostsSorted: [Host] {
            return self.hosts.sorted {
                if $0.alias != $1.alias {
                    return $0.alias < $1.alias
                }
                else {
                    return $0.aliasOrHost < $1.aliasOrHost
                }
            }
        }
        */
        
        var hasDeprecated: Bool {
            return self.hosts.filter { $0.clientImpl == .moscapsule }.first != nil
        }
        
        init(hosts: [Host] = [], initMethod: InitHost) {
            self.initMethod = initMethod
            self.hosts = hosts
        }
        
        func delete(at offsets: IndexSet, persistence: HostsModelPersistence) {
            let original = hostsSorted
                    
            for idx in offsets {
                persistence.delete(original[idx])
            }
            
            var copy = hosts
            copy.remove(atOffsets: offsets)
            self.hosts = copy
        }
        
        func delete(_ host: Host) {
            self.hosts = self.hosts.filter { $0 != host }
      }
    }
    

}
