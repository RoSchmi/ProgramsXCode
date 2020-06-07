//
//  DetailView.swift
//  SwiftCallbackFromDetailPage
//
//  Created by user on 06.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct PublishFixedMessageDetailView: View {
    
    @ObservedObject var fixedMessage: FixedMessage
    
    @ObservedObject var fixedMessagesModel: FixedMessagesModel
    
    //var didAddPerson: (FixedMessage) -> ()
    
    //@Binding var type: PublishFixedMessageType
    
    var body: some View {
        Form {
            VStack(alignment: HorizontalAlignment.leading) {
            
        Section(header: HStack {Text(""); Spacer()}) {
            Text("")
        }
        Section(header: HStack {Text("Title"); Spacer()}) {
        TextField("#", text: $fixedMessage.title)
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .font(.body)
        .background(Color.secondary)
                }
                            
        Section(header: HStack {Text("Function"); Spacer()}) {
        TextField("#", text: $fixedMessage.explanation)
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .font(.body)
        .background(Color.secondary)
                }
        
            }
    }
        Button(action: { self.doCommand()}, label: {Text("Command")})
}
    
    func doCommand() {
        
    }
}
