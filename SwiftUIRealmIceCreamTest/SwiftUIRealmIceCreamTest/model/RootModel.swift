//
//  RootModel.swift
//  SwiftUIRealmIceCreamTest
//
//  Created by user on 16.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

protocol InitCommand: class {
    func initCommand(command: Command)
}

class RootModel: ObservableObject {
    static let controller = MQTTSessionController()
    
    let sessionController = controller
    
    let commandsModel = CommandsModel(initMethod: controller)

    let persistence: CommandsModelPersistence

    init() {
        self.persistence = CommandsModelPersistence(model: commandsModel)
        self.persistence.load()
    }
}
