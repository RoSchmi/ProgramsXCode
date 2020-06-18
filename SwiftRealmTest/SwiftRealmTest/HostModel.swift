//
//  HostModel.swift
//  SwiftRealmTest
//
//  Created by user on 16.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import Foundation
import SwiftUI




extension Host: Hashable {
    static func == (lhs: Host, rhs: Host) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.ID)
    }
}

/*
struct TopicSubscription: Codable {
    var topic: String
    var qos: Int
}
*/

/*
struct CertificateFile: Codable {
    let name: String
    let location: CertificateLocation
    var type = CertificateFileType.undefined
}
*/

class Host: Identifiable, ObservableObject {
    
    let ID: String
    
    var deleted = false
    
    var alias: String = ""
    var hostname: String = ""
    var port: UInt16 = 1883
    var subscriptions: [TopicSubscription] = [TopicSubscription(topic: "#", qos: 0)]
    var subscriptionsReadable: String {
        return subscriptions.map { $0.topic }.joined(separator: ", ")
    }
    
    var protocolMethod: HostProtocol = .mqtt
    var clientImpl: HostClientImplType = .cocoamqtt
    var basePath: String = ""
    var ssl: Bool = false
    var untrustedSSL: Bool = false
    
    var limitTopic = 250
    var limitMessagesBatch = 1000

    var clientID = ""
    
    init(id: String = NSUUID().uuidString) {
        self.ID = id
    }
    
    var computeClientID: String {
        let trimmed = clientID.trimmingCharacters(in: [" "])
        return trimmed.isBlank ? Host.randomClientId() : trimmed
    }
    
    var aliasOrHost: String {
        return alias.isBlank ? hostname : alias
    }
    
    var qos: Int = 0
    
    var auth: HostAuthenticationType = .none
    var username: String = ""
    var password: String = ""
    
    var certificates: [CertificateFile] = []
    var certClientKeyPassword: String = ""
    
    @Published var usernameNonpersistent: String?
    @Published var passwordNonpersistent: String?
    
    var needsAuth: Bool {
        return auth == .usernamePassword
            && (username.isBlank || password.isBlank)
            && (usernameNonpersistent == nil || passwordNonpersistent == nil)
    }
    
    @Published var connectionMessage: String?
    
    weak var reconnectDelegate: ReconnectDelegate?
    weak var disconnectDelegate: DisconnectDelegate?
    
    @Published var state: MQTTConnectionState = .disconnected {
        didSet {
            if state == .connected {
                wasConnected = true
            }
        }
    }
    
    @Published var pause = false
    
    var wasConnected = false
    
    func reconnect() {
        reconnectDelegate?.reconnect(host: self)
    }
    
    func disconnect() {
        disconnectDelegate?.disconnect(host: self)
        state = .disconnected
        
        usernameNonpersistent = nil
        passwordNonpersistent = nil
        wasConnected = false
    }

}

class HostsModel: ObservableObject {
    let initMethod: InitHost
    
    @Published var hosts: [Host] {
        willSet {
            for host in newValue {
                initMethod.initHost(host: host)
            }
        }
    }
    
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
