//
//  ContentView.swift
//  SwiftCallbackFromDetailPage
//
//  Created by user on 06.06.20.
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
        hasher.combine(title)
        hasher.combine(explanation)
        hasher.combine(topic)
        hasher.combine(message)
        hasher.combine(qos)
        hasher.combine(retain)
        hasher.combine(messageType)
        
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



/*
id: String = NSUUID().uuidString,
name: String
let pathName: String
let path: [JSONSubscriptType]
var value: PublishMessagePropertyValue
*/

final class FixedMessagesModel: ObservableObject {
    @Published var fixedMessages: [FixedMessage]
    = [
        FixedMessage(id: "1", title: "Switch Light On", explanation: "None", topic: "#", message: "", qos: 0, retain: false, messageType: MessageType.on_off),
        FixedMessage(id: "2", title: "Switch Light Off", explanation: "None", topic: "#", message: "", qos: 0, retain: false, messageType: MessageType.on_off),
        FixedMessage(id: "3", title: "Switch Heating On", explanation: "None", topic: "#", message: "", qos: 0, retain: false, messageType: MessageType.on_off)]
}

struct ContentView: View {
    
    @ObservedObject var fixedMessagesModel = FixedMessagesModel()   //
    
    @State var isActiveNavigationLink = true
    @State var navigationLinkLabel = "Heinz"
    
    var body: some View {
        return NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(fixedMessagesModel.fixedMessages, id: \.self) {
                        SelectedMessage in
                        PublishFixedMessageCellView( selectedFixedMessage: SelectedMessage, fixedMessagesModel: self.fixedMessagesModel)}
                        .onDelete(perform: delete)
                }
            }
            
        }
        }
    func delete(at offsets: IndexSet) {
        fixedMessagesModel.fixedMessages.remove(atOffsets: offsets)
    }    }



