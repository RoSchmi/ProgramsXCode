//
//  PublishFixedMessageDetailView.swift
//  SwiftRealmTest
//
//  Created by user on 15.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//



import SwiftUI

struct PublishFixedMessageDetailView: View {
       
    // Note: here fixedMessage is @State
    // on the parent (CellView) it is @ObservedObject
    // if it were @ObservedObject here too,  we would have  a circle and the App crashes
    @State var fixedMessage: FixedMessage
    
    @ObservedObject var fixedMessagesModel: FixedMessagesModel
    
    var function_on_parent: () -> Void
    var function_on_grandparent: () -> Void
    
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
            Button(action: { self.function_on_parent()}, label: {Text("Cmd to parent")})
                
            Button(action: { self.function_on_grandparent()}, label: {Text("Cmd to grandparent")})
        }
    }
}

