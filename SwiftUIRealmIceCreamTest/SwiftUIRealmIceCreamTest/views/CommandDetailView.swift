//
//  CommandDetailView.swift
//  SwiftUIRealmIceCreamTest
//
//  Created by user on 17.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct CommandDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    // Note: here command  is @State
    // on the parent (CellView) it is @ObservedObject
    // if it were @ObservedObject here too,  we would have  a circle and the App crashes
    @State var command: Command
    
    @ObservedObject var commandsModel: CommandsModel
    
    var function_on_parent: () -> Void
    var function_on_grandparent: () -> Void
    
    var body: some View {
        Form {
        VStack(alignment: HorizontalAlignment.leading) {
            
            Section(header: HStack {Text(""); Spacer()}) {
            Text("")
            }
            Section(header: HStack {Text("Title"); Spacer()}) {
                TextField("#", text: $command.title)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.body)
                    .background(Color.secondary)
            }
            Section(header: HStack {Text("Function"); Spacer()}) {
                TextField("#", text: $command.explanation)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.body)
                    .background(Color.secondary)
            }
            Section(header: HStack {Text("Actions"); Spacer()}) {
              Text("Send messages to parent or grandparent")
            }
            
        }
            .navigationBarTitle(Text("Command"), displayMode: .inline)
            //.edgesIgnoringSafeArea(.bottom)
            //Hide the system back button
            .navigationBarBackButtonHidden(true)
            // Add your custom back button here
            .navigationBarItems(leading: Button(action: { self.updateAndDismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Text("Go Back")
                }
    })
            Button(action: { self.function_on_parent()}, label: {Text("Cmd to parent")})
                
            Button(action: { self.function_on_grandparent()}, label: {Text("Cmd to grandparent")})
        
    }
  
    
        
        
    }
    func updateAndDismiss() {self.presentationMode.wrappedValue.dismiss()}
    
}



