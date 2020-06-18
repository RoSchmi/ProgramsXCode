//
//  CommandModel.swift
//  SwiftUIRealmIceCreamTest
//
//  Created by user on 17.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import Foundation
import SwiftUI

/*
enum CertificateLocation: Int, Codable {
    case cloud = 0
    case local = 1
}

enum CertificateFileType: Int, Codable {
    case p12 = 0
    case serverCA = 1
    case client = 2
    case clientKey = 3
    case undefined = 4
}

extension CertificateFileType {
    func getName() -> String {
        switch self {
        case .p12:
            return "Client PKCS#12"
        case .serverCA:
            return "Server CA"
        case .client:
            return "Client Certificate"
        case .clientKey:
            return "Client Key"
        case .undefined:
            return "Undefined"
        }
    }
}

enum HostAuthenticationType {
    case none
    case usernamePassword
    case certificate
}

enum HostProtocol {
    case mqtt
    case websocket
}

enum HostClientImplType {
    case moscapsule
    case cocoamqtt
}
*/


extension Command: Hashable {
    static func == (lhs: Command, rhs: Command) -> Bool {
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

//class Command: ObservableObject, Identifiable {
    class Command: Identifiable, ObservableObject {
        
        
        /*
    static func == (lhs: Command, rhs: Command) -> Bool {
            lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.explanation == rhs.explanation &&
            lhs.topic == rhs.topic &&
            lhs.message == rhs.message &&
            lhs.qos == rhs.qos &&
            lhs.retain == rhs.retain &&
            lhs.messageType == rhs.messageType
    }
    */
    let ID: String
        
    var deleted = false
        
    
    //@Published var id: String
        @Published var title = ""
        @Published var explanation = ""
        @Published var topic = ""
        @Published var message = ""
        @Published var qos = 0
        @Published var retain = false
        
    /*
    @Published var title: String
    @Published var explanation: String
    @Published var topic: String
    @Published var message: String
    @Published var qos: Int
    @Published var retain: Bool = false
    //@Published var messageType: MessageType
    */
    /*
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        // Only id is taken as hash (never the same)
     
    }
     */
    init(id: String = NSUUID().uuidString) {
        self.ID = id
    }
}
    /*
    init(id: String, title: String, explanation: String, topic: String, message: String, qos: Int, retain: Bool) {
        self.ID = id
        self.title = title
        self.explanation = explanation
        self.topic = topic
        self.message = message
        self.qos = qos
        self.retain = retain
       // self.messageType = messageType
    }
 */






/*
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
 let hostsModel = HostsModel(initMethod: controller)
 */

class CommandsModel: ObservableObject {
    let initMethod: InitCommand
    
    @Published var commands: [Command] {
        willSet {
            for command in newValue {
                initMethod.initCommand(command: command)
            }
        }
    }
    
/*
@Published var commands: [Command] = [
Command(id: NSUUID().uuidString), Command(id: NSUUID().uuidString)
    
Command(id: NSUUID().uuidString, title: "Switch Light On", explanation: "None", topic: "#", message: "", qos: 0, retain: false),
Command(id: NSUUID().uuidString, title: "Switch Light Off", explanation: "None", topic: "#", message: "", qos: 0, retain: false),
Command(id: NSUUID().uuidString, title: "Switch Heating On", explanation: "None", topic: "#", message: "", qos: 0, retain: false)
 */
  //  ]
    //let initMethod: InitHost

//@Published var commands: [Command] {
 //   willSet {
 //       for command in newValue {
           // initMethod.initHost(host: command)

    


/*
class HostsModel: ObservableObject {
    let initMethod: InitHost
    
    @Published var commands: [Command] {
        willSet {
            for command in newValue {
                initMethod.initHost(host: command)
            }
        }
    }
*/
    
    var commandsSorted: [Command] {
        return self .commands.sorted {
            if $0.title != $1.title {
                return $0.title < $1.title
            }
            else {
                return $0.title < $1.title
            }
        }
    }
 
    /*
    var hasDeprecated: Bool {
        return self.hosts.filter { $0.clientImpl == .moscapsule }.first != nil
    }
 */
    
    init(commands: [Command] = [], initMethod: InitCommand) {
        self.initMethod = initMethod
        self.commands = commands
    }
    
    func add(persistence: CommandsModelPersistence, command: Command)
    {
        
        persistence.create(command)
    }
    
    func delete(at offsets: IndexSet, persistence: CommandsModelPersistence) {
        let original = commandsSorted
                
        for idx in offsets {
            persistence.delete(original[idx])
        }
        
        var copy = commands
        copy.remove(atOffsets: offsets)
        self.commands = copy
    }
    
    /*
    func delete(_ host: Host) {
        self.hosts = self.hosts.filter { $0 != host }
    */

}


