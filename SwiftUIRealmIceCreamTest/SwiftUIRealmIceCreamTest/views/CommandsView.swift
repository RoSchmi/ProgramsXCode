//
//  CommandsView.swift
//  SwiftUIRealmIceCreamTest
//
//  Created by user on 17.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

// actually not used
/*
enum MessageType {
    case on_off
    case percent
    case doubleNumber
}
*/

struct CommandsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var model: RootModel
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
                    // (\.id) with 4 parameters
                    ForEach(commandsModel.commands, id: \.ID) {
                    SelectedCommand in
                    CommandCellView(
                    selectedCommand: SelectedCommand,
                    commandsModel: self.commandsModel,
                    function_on_grandparent: {self.printMessageFromGrandparent()},
                    function_on_parent_update: {self.update(command: $0)} )}
                    .onDelete(perform: delete)
                }
            }
          }
       }
    }
    
    func addRow() {
    let newCommand: Command = Command(id: NSUUID().uuidString)
        newCommand.title = "CommandName"
        newCommand.explanation = ""
        newCommand.topic = "None"
        newCommand.message = "None"
        newCommand.qos = 0
        newCommand.retain = false
    
        commandsModel.commands.append(newCommand)
        commandsModel.add(persistence: model.persistence, command: newCommand)
    }
       
    func update(command: Command) {
        commandsModel.update(persistance: model.persistence, command: command)
    }
    
    func delete(at indexSet: IndexSet) {
       
        commandsModel.delete(at: indexSet, persistence: model.persistence)
    }
        
    func printMessageFromGrandparent() {print("This is message from grandparent")}
}

