//
//  CommandCellView.swift
//  SwiftUIRealmIceCreamTest
//
//  Created by user on 17.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct CommandCellView: View {
    // Note: here selectedFixedMessage is @ObservedObject
    // on the child (DetailView) it is @State
    // otherwise we might have a circle and the App crashes
    @ObservedObject var selectedCommand: Command
     
    @ObservedObject var commandsModel: CommandsModel
     
     var function_on_grandparent: () -> Void
    var body: some View {
        NavigationLink(destination:
            CommandDetailView(command: selectedCommand,
                              commandsModel: self.commandsModel,
                              function_on_parent: {self.printMessageFromParent()}, function_on_grandparent: {self.handOverCommandToGrandparent()})) {
            
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(selectedCommand.title)")
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Commands")
            
        }
        
        func printMessageFromParent() {print("This is message from parent")}
        
        func handOverCommandToGrandparent(){ self.function_on_grandparent()}
    
}



