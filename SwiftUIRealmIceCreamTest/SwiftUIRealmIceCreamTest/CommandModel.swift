//
//  CommandModel.swift
//  SwiftUIRealmIceCreamTest
//
//  Created by user on 17.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import Foundation
import SwiftUI

extension Command: Hashable {
    static func == (lhs: Command, rhs: Command) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.ID)
    }
}

class Command: Identifiable, ObservableObject {
    let ID: String
    var deleted = false
        
    //@Published var id: String
        @Published var title = ""
        @Published var explanation = ""
        @Published var topic = ""
        @Published var message = ""
        @Published var qos = 0
        @Published var retain = false
        
    
    init(id: String = NSUUID().uuidString) {
        self.ID = id
    }
}
   
class CommandsModel: ObservableObject {
    let initMethod: InitCommand
    
    @Published var commands: [Command] {
        willSet {
            for command in newValue {
                initMethod.initCommand(command: command)
            }
        }
    }

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
 
    init(commands: [Command] = [], initMethod: InitCommand) {
        self.initMethod = initMethod
        self.commands = commands
    }
    
    func update(persistance: CommandsModelPersistence, command: Command)
    {
        persistance.update(command)
    }
    
    
    func add(persistence: CommandsModelPersistence, command: Command)
    {
        
        persistence.create(command)
    }
    
    func delete(at offsets: IndexSet, persistence: CommandsModelPersistence) {
        //let original = commandsSorted
        let original = commands
        for idx in offsets {
            persistence.delete(original[idx])
        }
        var copy = commands
        copy.remove(atOffsets: offsets)
        self.commands = copy
    }
}
