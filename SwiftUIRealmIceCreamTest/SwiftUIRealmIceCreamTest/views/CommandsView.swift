//
//  CommandsView.swift
//  SwiftUIRealmIceCreamTest
//
//  Created by user on 17.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI



enum MessageType {
    case on_off
    case percent
    case doubleNumber
}
/*
class Command: ObservableObject, Hashable, Identifiable {
    
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
*/
/*
final class CommandsModel: ObservableObject {
    @Published var commands: [Command]
    = [
        Command(id: NSUUID().uuidString, title: "Switch Light On", explanation: "None", topic: "#", message: "", qos: 0, retain: false, messageType: MessageType.on_off),
        Command(id: NSUUID().uuidString, title: "Switch Light Off", explanation: "None", topic: "#", message: "", qos: 0, retain: false, messageType: MessageType.on_off),
        Command(id: NSUUID().uuidString, title: "Switch Heating On", explanation: "None", topic: "#", message: "", qos: 0, retain: false, messageType: MessageType.on_off)]
}
*/

struct CommandsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var model: RootModel
    //@ObservedObject var hostsModel: HostsModel
    //@ObservedObject var commandsModel = CommandsModel()
    @ObservedObject var commandsModel: CommandsModel
    
    var body: some View {
            return VStack {
            HStack {
                Spacer()
           Button(action: { self.addRow()}, label: {Text("Add Command")})
            }
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    // means: create 'CommandCellView' for
                    // each row (identified uniquely by the hash
                    // of the row 'command' (\.self) or the id
                    // (\.id) with 3 parameters
                    ForEach(commandsModel.commands, id: \.ID) {
                    SelectedCommand in
                    CommandCellView(
                    selectedCommand: SelectedCommand,
                    commandsModel: self.commandsModel,
                    function_on_grandparent:
                    self.printMessageFromGrandparent)}
                    .onDelete(perform: delete)
                }
            }
          }
       }
    }
    
    func addRow() {
    let newCommand: Command = Command(id: NSUUID().uuidString)
        newCommand.title = "Dummy"
        newCommand.explanation = "None"
        newCommand.topic = "None"
        newCommand.message = "None"
        newCommand.qos = 0
        newCommand.retain = false
    
        commandsModel.commands.append(newCommand)
        commandsModel.add(persistence: model.persistence, command: newCommand)
    }
        //self.root.persistence.create(newCommand)    
    /*
    func delete(at offsets: IndexSet) {
        commandsModel.commands.remove(atOffsets: offsets)
    }
    */
    
    func delete(at indexSet: IndexSet) {
       
        commandsModel.delete(at: indexSet, persistence: model.persistence)
    }
    
    
    func printMessageFromGrandparent() {print("This is message from grandparent")}
}

