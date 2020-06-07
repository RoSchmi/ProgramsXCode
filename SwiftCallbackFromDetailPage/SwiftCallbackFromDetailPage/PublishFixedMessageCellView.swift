//
//  PublishFixedMessagesCellView.swift
//  SwiftCallbackFromDetailPage
//
//  Created by user on 06.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

struct PublishFixedMessageCellView: View {
    
   @ObservedObject var selectedFixedMessage: FixedMessage
    
    @ObservedObject var fixedMessagesModel: FixedMessagesModel
    
    
   //{.init(id: "", title: "", explanation:"", topic: "", message: "", qos: 0, retain: false, messageType: MessageType.on_off)}
    
    var body: some View {
        PublishFixedMessageDetailView(function: {})
            
        NavigationLink(destination: PublishFixedMessageDetailView( fixedMessage: selectedFixedMessage, fixedMessagesModel: fixedMessagesModel)){
    
            VStack(alignment: .leading) {
                HStack {
                    Text("\(selectedFixedMessage.title)")
                    Spacer()
                }
            }
            func setViewBackToNil() {print("I am the parent")}}        }
        
    
}
        


