//
//  ContentView.swift
//  SwiftRealmTest
//
//  Created by user on 15.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

enum MessageType {
    case on_off
    case percent
    case doubleNumber
}

class FixedMessage: ObservableObject, Hashable, Identifiable {
    
    static func == (lhs: FixedMessage, rhs: FixedMessage) -> Bool {
            lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.explanation == rhs.explanation &&
            lhs.topic == rhs.topic &&
            lhs.message == rhs.message &&
            lhs.qos == rhs.qos &&
            lhs.retain == rhs.retain &&
            lhs.messageType == rhs.messageType
    }
    
    @Published var id: String
    @Published var title: String
    @Published var explanation: String
    @Published var topic: String
    @Published var message: String
    @Published var qos: Int
    @Published var retain: Bool = false
    @Published var messageType: MessageType
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        // Only id is taken as hash (never the same)
        
    }
    init(id: String, title: String, explanation: String, topic: String, message: String, qos: Int, retain: Bool, messageType: MessageType) {
        self.id = id
        self.title = title
        self.explanation = explanation
        self.topic = topic
        self.message = message
        self.qos = qos
        self.retain = retain
        self.messageType = messageType
    }
}

final class FixedMessagesModel: ObservableObject {
    @Published var fixedMessages: [FixedMessage]
    = [
        FixedMessage(id: NSUUID().uuidString, title: "Switch Light On", explanation: "None", topic: "#", message: "", qos: 0, retain: false, messageType: MessageType.on_off),
        FixedMessage(id: NSUUID().uuidString, title: "Switch Light Off", explanation: "None", topic: "#", message: "", qos: 0, retain: false, messageType: MessageType.on_off),
        FixedMessage(id: NSUUID().uuidString, title: "Switch Heating On", explanation: "None", topic: "#", message: "", qos: 0, retain: false, messageType: MessageType.on_off)]
}

struct ContentView: View {
    
    @ObservedObject var fixedMessagesModel = FixedMessagesModel()
    
    var body: some View {
        return VStack {
            HStack {
                Spacer()
           Button(action: { self.addRow()}, label: {Text("Add Command")})
            }
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    // means: create 'PublishFixedMessageCellView' for
                    // each row (identified uniquely by the hash
                    // of the row 'fixedMesssages' (\.self) or the id
                    // (\.id) with 3 parameters
                    ForEach(fixedMessagesModel.fixedMessages, id: \.id) {
                    SelectedMessage in
                    PublishFixedMessageCellView(
                    selectedFixedMessage:SelectedMessage,
                    fixedMessagesModel: self.fixedMessagesModel,
                    function_on_grandparent:
                    self.printMessageFromGrandparent)}
                    .onDelete(perform: delete)
                }
            }
        }
        }
    }
    func addRow() {
    let newMessage: FixedMessage = FixedMessage(id: NSUUID().uuidString, title: "Dummy", explanation: "None", topic: "None", message: "None", qos: 0, retain: false, messageType: MessageType.on_off)
    
        fixedMessagesModel.fixedMessages.append(newMessage)
    }
    
    func delete(at offsets: IndexSet) {
        fixedMessagesModel.fixedMessages.remove(atOffsets: offsets)
    }
    func printMessageFromGrandparent() {print("This is message from grandparent")}
}


